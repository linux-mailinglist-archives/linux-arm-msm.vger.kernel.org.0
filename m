Return-Path: <linux-arm-msm+bounces-97122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJuuIDQusmmzJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:08:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F38BB26CA1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABD6F301D4E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F31383C60;
	Thu, 12 Mar 2026 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A39+OUGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSqZeZv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE8374E5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284846; cv=none; b=ENxNWXEhQR8YdAp7uxas/d9LrTgEXaMLwmDq2Yp61UkCQ4KgjiufuOFmiMVpBIyNspLUnY2sw1rz+V7pHT2f3uSmgDsr1ugBSqsHcbJorvWuZp1YnuC6fAQ2HH5fii/mxAvzgbgxFjrKe3je9s9vIkhvxpaNgb3Hks+2I7eSCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284846; c=relaxed/simple;
	bh=fx31dok0skjrBmp4xN0rQPPK/x9cQTxDjbrh8bf7WEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdxm6St6y850DJs41FhuivO/H7W4xQFYIi9fnerdBXJifkGaQuxojZb0SKdAdqSadq5198OU4udk+VUsqCPoeiN6N3VzYS5jAEGlSYHTaoKn0i/j7o8+nlhZA6K1PBPNRMXXjgLeni/fY3E8vJj6+t8/K31sXLQcg9wgPuNZ+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A39+OUGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSqZeZv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN1pw4132906
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDykXqpwkk8mu6woc2v63jWt
	si9Wh/LNGs2SYHSgSAA=; b=A39+OUGOB7jHnha1JM+mP+NrU2+FET2WYOsEF+hs
	/oSSrs35qmSFuXoTZJKtkg4oBAFbfJqUMcLoil7nlEh8g2Ua9O+2pe5JJAFee3zB
	Z1zU2rkkVf2tHTSrjvoOBXkjgiFl5mNhD6TECmYs0UAXqskfQSKOx6SlalwAmqnz
	vdDH5uR7R3d9wXpbjFbSZN1Wyz4+pczGmO164APmk3RpOMsVnblOk5bBsD8YVB8x
	NxE7yqjr4fEaNU+fnfz91pvyGyuci4OBvckJ6CGPcofEBL4fnxZ/QxylnsIvR6N1
	CkVlG+2Kkz97g9Z7cghgB+VZNba9mRh4UQhI0DYuJBninw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w0ney-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:07:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so346911085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284843; x=1773889643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDykXqpwkk8mu6woc2v63jWtsi9Wh/LNGs2SYHSgSAA=;
        b=PSqZeZv0OSV+WVptxVhJyq4/K1Y/UP9AjXs+R+Qun3dfozC+phKqs1CTxJ6JK/i6Ct
         +2pn3aYCqwjnZaL52ik1Aqyk+63YWPuLhazRwvKEFEOHwelFZOaHyd0SRxl1qIlPxypx
         FD34LZoxcr2DjQfOgDULCohuXledTmY8Olb+bi2YzmqY0fLniE3ST/pFN00axntkeW7e
         YEUnX3vfmf+iSDAIeMszZmcWZ4our/R58Hd2GvXzSZbAI6TxPHfu05r8l2nyOHbX953o
         X9dtw2IlbVaeiTIq2rfqRFsAh+x3ECx4DWP7kKkqedvuNcd5hqW7YwO7WjAorW4uRjVq
         6+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284843; x=1773889643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDykXqpwkk8mu6woc2v63jWtsi9Wh/LNGs2SYHSgSAA=;
        b=cPZPKlxo3G05f/lJrM7bLQ8rXa9v7UTX0Eg7ZLAKfQA8QsLTJe211jenVzx7oq3SmF
         ecHFLtVgIOM9Oqyp9YROnvRRardcUNDuJfgB4YANoa6tTfG3Pz0iRI9Qff+AqZaoxqAB
         ks8N9YV9skfsTwHm/bXDtw86Ioj0pjZOIRKhsa4sE9U5BGk+SHgwRVmZeCcHSmAQStC3
         cXXVBVCMHjxu2R5i4HCPROJ8OacSEo+hTIrv9ziC4ktU9BQmZ9JOEkcS6Ec88D/79Eon
         NL3Xtx/zazS5vrCePTUNX/Om9tLTZOdvs69OBKF6x/K+9Ug8kyFvKdRKN7MdfVCROe9/
         aLig==
X-Forwarded-Encrypted: i=1; AJvYcCXuDDnQvp16T6JZcVO55I5rLFzZkkXUldTbf9SuWQb2WMeG/AAnKKO4TDylj8EiZAwlsp0JSLb9PE6Lo1mj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/+x9I0PKbUbmybhuyB7bvzG0ySG7JZIonJs8YpvWeTAyrUWa
	Oo8OivcVUZRsbpM92NtPVhrNZter1AGMGOLmmu/tb+p+soxaPH3gnuVfUBhN7yU7zZS1pWfEoUu
	c32RnGeHm41+NvlQpbN2d2SxdXIEO6tJIJ2/HxpKdKEiHcSmtz6r8mry+Tqsx/QdVENK4
X-Gm-Gg: ATEYQzyX/ko6/Q0Dmc0mU2dF5RA0sjNeSOncl/cICIrqwYwKmv0DgMx/cU5//cr4J2M
	FBL38rp0+CDVAohZDDwis2gbHZ7RcdR0cEaBgio0u0cZBahLXxvU6e8ho5A6JPmXlgC4Xbj/PnW
	cFOz5kDoBG9BogdIKSXv9RRilu/0CYN74GGp0eIuI1dM1W9P/fI47vBt1LxneXgXUYCSOCn8sSF
	y+1UdSAL8zENY5Y7EM9CSgeTrL5kFcAVZKl1PL60Jy+hKPfojhD66ont9C+Xj8ZD980FyhpFpIN
	JC0bjDlGmj/fzxITiKHi595f7LbaVbP0hA+CNYM7EjdieX5BAH51PbhzkJVJiZayqWX29xuvAeW
	XoyCBoh9h8W917pqgL6fNFdvN1cdUd5b7+cqqi5MzDDPLrtc6zmD8RjxN8RdrX73Kbp1MQVPw5d
	YOIHW3UOtjFzWFYqg2ovjPOJM6ouN/zrS3CCs=
X-Received: by 2002:a05:620a:444d:b0:8cd:78e3:879f with SMTP id af79cd13be357-8cda1a1bc1dmr614400985a.35.1773284843372;
        Wed, 11 Mar 2026 20:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:78e3:879f with SMTP id af79cd13be357-8cda1a1bc1dmr614399085a.35.1773284842963;
        Wed, 11 Mar 2026 20:07:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162af2sm720909e87.59.2026.03.11.20.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:07:21 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:07:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <dco5knujhpt6rm6e2osfxsuqr4uqjz6tugkhvi7cnx5wbbpmum@ejjfx3d7onoc>
References: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311070408.2287889-1-hangtian.zhu@oss.qualcomm.com>
X-Proofpoint-GUID: j3pYDsHxasfEVobsa7CwMT1vYUFP5HEK
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b22dec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7j0mPr_bSujbqgIjpDIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: j3pYDsHxasfEVobsa7CwMT1vYUFP5HEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfX56nY0cTQSHYv
 X0kVqObI7rTgxzdPup0EXdBplvzuqXj1g12DncKNNXfcXCuyVlE2VKxUAxsUzxCr/CBwluFRPSM
 38/yAT1qouN1rEnHiS/NVLQZClGbZxM6BM8+P3sjOEUkvwioBGFjorZDNwAHeGrolFmyNX82stN
 Ksk61z0otPT+N/6BTB3C2uY32Kgn5gewKRhz5RVgFL2bS0EHXwJ3zIJqJdWg3k9cJfnHXms9zVE
 CuzW03Ivmo6Zdj+7AAglDDfgBqePB10mZsV2tsLw/3IdbrghummzAIennumfWkUN4isQ5VztxwB
 9rw1V632kQCzP0Wk9LDcja8cMq0UG7xlBpgRMjHXkbPkx+7f05Jm95+8fEttjGOLUAdE+RbpRgm
 ++afF1ugHwgPcrkSEoq88rdH1ea7lPLKBLXperCcXuMswWvFVYo9uNxYr/SMKlc7tHeqUJlNXt7
 tCsBnVt11cKdUoQFLSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97122-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F38BB26CA1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:04:08PM +0800, Hangtian Zhu wrote:
> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> 
> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> mezzanine platform, PCIe0 lines are moved from WCN6750 to TC9563 pcie
> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> platform.
> 
> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> ---
> This patch depends on:
> [PATCH v4 2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
> https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/

If it is a fix for the patch which is still in flight, then stop posting
it as a separate patch. PLease work with the original series author to
get it squashed into the posted patch.

> 

-- 
With best wishes
Dmitry

