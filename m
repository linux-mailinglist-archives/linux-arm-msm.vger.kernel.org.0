Return-Path: <linux-arm-msm+bounces-97203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KACjDHexsmmYOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:28:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760C271BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2107D3045ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14BB2BE057;
	Thu, 12 Mar 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lnd1Qlzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKAjitIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D72D5C68
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318308; cv=none; b=e7iNgT2A0atKFaUHyX2Pukt1A0spJeKnxf3IlXUuOHm+D82d/GYJGQ9bsOe0n9Qjw319zWRu4IWrvPC5mvVzVMkSUj4SkFEsvl4/EJUq7wRmrvae82MBF2d8SF818JBPyw79eRIrbGkB/VFV9dgiJ7cR+z/o7j73Wj/N8umq+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318308; c=relaxed/simple;
	bh=9vax4mRv+ZIHx9WFJYIjJgbBCYugCcoMblax+rJ6408=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om0ZrOURga8RxYwEh6ooVajdBfk7dAE9sH8Y3dkHQxUZ8bRMWdREljCxUb8D78dnB7vPRpFt0cVPOKvtl6rovfHx7fpI3uDclM56fGgbJ8WSpg4x2AoJv0e3d07x/nSogUoVjRG2PBherL/Yu8UNgwgLtBAMqQBQN76ysAhGa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lnd1Qlzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKAjitIK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CALhwe4026710
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5JaLhYXw0RSXyl2gHloRFM3B
	UgmsEhqsm6iB6g8egXM=; b=Lnd1QlzmusBjpLTIR+/GkEHqWSbl0XZt6swzheJX
	IoYvkTyAEA5anKgktQqLxsOTcvDfH3pKLaV1qSoIw/Y3lVyfViQNZ0KlsJ/Tn60F
	twGItt6651MgqmjmsaF6fALkQN5iXh0PYM2gRyH2i+zfsfQDxy3t0xRCnvCITUhZ
	m8tVALhoJ45eLO6chu7NDrHElYCIeY1/SxCE7Q80UUDMV1qwlnqJDrCSJJB2x1MG
	7iG1AZs0tJI8ZkaQmBi8SRsokuFCJgXPVapdP5PzQlrBFCmqTrS0t8kZ/OussV3A
	nOxUCeOlswfnEhC9TgJYXYDicH6pwWkyIAe885Jsimd3iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54t0xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:25:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd767c51efso102536385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773318306; x=1773923106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JaLhYXw0RSXyl2gHloRFM3BUgmsEhqsm6iB6g8egXM=;
        b=bKAjitIKVgTXV5VfxqqPVnkAY0Bw5d0+V+DJ2ufGeYvGm9rmyJ/HR0DfJE8j7YZRJM
         5Pf3ZmwUjNiAuFG3gdLIB65D9rTb7EL/YkA/XguXh8VM99QUHZJFFIahxJuIEu/sQb5p
         6CtwOFNyxGOnbpPgu5Q8T6hu+VzmJ4nWvDlBDvTUEL5eRzts8ZhzEB9jFDddyGTBBVK4
         Ms0INgseVZ0N8KP3nfa91ZfxTDW+TUdLGuqsRvm+Ynv5G/x44bCjzFE+wpGhFYASC7gf
         whx4Kx+WbEReFct/1JI6rjFGanAWsf8ocfapCyRkvB36bIy4WXtyWnSWqIidjFFMYsXd
         iYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318306; x=1773923106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JaLhYXw0RSXyl2gHloRFM3BUgmsEhqsm6iB6g8egXM=;
        b=IlE7LDA/cdW7Rsu2revlTj35mdkUeITSfYZv0byYf1iYfACdNZd8STqkuo4pcq9DQq
         POv9AuOui/Dg5jT8T9/RL+DmYTwLX10SFhvBN41eM0mTAcocmsHBlP5sAxrDpTgOycki
         0+63VUi79Ta4hRKZaMwMhPN/7Fl1wgmAE1ih+qMdf+jum2uHVKFbQRLWFq2DeZsJsNRa
         DLy/EmXtwvtQTj97mxa05eDGH1tfCjZ385jSMfkXfsxGRvDY5t7xJ/0I6VVTWWfsyOjW
         aksrsFnSskt4YfkEq53WrEfspSAFYQ63ZuanutSN+1B/2vzfEgrxL24iLfMo29PuPPGM
         xKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbBDM30Ezp8dohOoDqGjPZkYAgupObyicCLYLWOabe91oHjgpDVNComFtNNTIJTumW0jGYVVv+Ic5Yv7nc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/8Wg8TJ3EfPauY87WnCwwz37/cgFefLxoP08BaNXJ5V87n+K
	ZI01BTKryCDxs1mTrCSEbOXtQdH7Wf0jd+4bBbniInOYv1HFqmD9b7em26gr/dR7lFRqV3l8AUp
	4LfVfOsSVASIIbmenTcdMNaSz/BToKPiVLEisqK/qUXvT+7LpJzNXCed5CRjZC8/A5F67
X-Gm-Gg: ATEYQzz648TpOnDXGrLsxVgZmxZDNqMDrh0vxu/CzA2MpM4hYi4KGNimvu3FsEkmaD0
	J84/7GITloQlN97ZfDQmXpua49ZtkE+2YrSL493xFYSbruU54sPgvEdeptwpaHHRvq/gh9VYZwI
	ytSv780Rpfb2dp4Dn11FF59DriKUJVRAteCh9bD+qAnA251ObNmyve8Um4hQ86B+FMsA7Y43L7p
	pJX2DbD0J/j9TURzDP8aINdUh9hJbPc6y8VD/pbddsZ1YZZrh3yzKGWmE6cRJiu57wksGo3A5G3
	vIqTGq28YI/SljUYkju99xZj5AjX+xF3Atjzl5GoqOwM0DCfEYqasQxnIlHaoqEzitVvmb2K+60
	7JNjyLzG8CV6cZcfWCg+YqcGUap3HwrKZow==
X-Received: by 2002:a05:620a:1a08:b0:8cd:8f04:50df with SMTP id af79cd13be357-8cda19360fdmr759621885a.12.1773318305757;
        Thu, 12 Mar 2026 05:25:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:8cd:8f04:50df with SMTP id af79cd13be357-8cda19360fdmr759617985a.12.1773318305164;
        Thu, 12 Mar 2026 05:25:05 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm1048144f8f.36.2026.03.12.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:24:58 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:24:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v6 0/6] clk: qcom: Add support for basic
 clocks providers on Eliza SoC
Message-ID: <ermbzju56beeuah6u6ezvkeb22c3nriqmgnbaxivfczqpkswfr@bc4ukm4pbzls>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
 <177326259462.44574.3228852589174701354.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177326259462.44574.3228852589174701354.b4-ty@kernel.org>
X-Proofpoint-GUID: LBAv4EEr75r8L1purjDZfOm3IxrbCXm2
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2b0a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=o3WNsQfHC4QgS8L6BeUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LBAv4EEr75r8L1purjDZfOm3IxrbCXm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5NyBTYWx0ZWRfXzJ71zYvHMMIe
 nSFDvjK/nRaPenUgTld7zdALRoJCmXtNxOcw+6H/gj02VosR6fgLNFximCwYqpZK1/niXjbuaaq
 JK2X6w0VzueiE5iE4FqpQDLQyU475qlyYfcsCm0a+5j+zLCabm/FiEzWmOM13WxOTCJ3l0j5Gq2
 ui6kfGZtLoDxT9Gx2twh28Ta3gD8k2+9OX0CoblvhzzxzlKLYSt9xpCSYbh0Jgie1rWWmhAGbct
 H1osngsQS3wekU4TVbr8HAhW4PvWnzgYsKE2466ZjkpVgqGj3MtmxxdU3ABV0TzSYS4gdM8YaEc
 r0Rba0DBdyfkDOOrqq2gtB/CIgWmc49nWcyuT70Nkr/nNm4WzqNUtyNcGMkOABon+6UvktiSTUE
 wIAnTIQLkIACGvX5SUT488lsmh90jXlYLXf/tfdeKPi2bsqBq1+XKl4NJjIEoAgCJw7BUzKmHWF
 6cQ4y39lm4Ib+dIszYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97203-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8760C271BE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-11 15:56:34, Bjorn Andersson wrote:
> 
> On Wed, 11 Mar 2026 16:46:30 +0200, Abel Vesa wrote:
> > These are the bare minimum clock providers needed in order to
> > be able to boot to shell and have the rootfs on UFS.
> > 
> > The multimedia-specific clock providers will come later on.
> > 
> > 
> 
> Applied, thanks!
> 
> [4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
>       commit: 76cbaa6557b1e685a268f08f892a35004bd4fdd2
> [5/6] clk: qcom: Add support for Global clock controller on Eliza
>       commit: 3d356ab4a1ec2d9b208f0d0020c79855097b1fc7
> [6/6] clk: qcom: Add TCSR clock driver for Eliza
>       commit: c69a586344758f0d9cf0526d2a4b14fb56941b10

Thanks!

But without bindings ?

