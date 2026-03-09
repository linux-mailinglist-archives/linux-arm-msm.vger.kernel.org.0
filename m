Return-Path: <linux-arm-msm+bounces-96280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBBpHrvermm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:52:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C23AF05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0BD4305B946
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA20B3D5241;
	Mon,  9 Mar 2026 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnPnstlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qkeyz60b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F63AE704
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067876; cv=none; b=YBsHL3SVXKpW8jsv2ENtli/+elhLWLpCQFa1tcYQ32lFIiFkO/5gAv5l0Lvy76qCTNlCq+vniD7aaknG9ey2D7k0XYBSDNkuFruMgGJnHPYl4tDkq7ox9lTuiSspZUq7bml8TveiKfduJDOzcSZCQ62fz8BbwmBkvssTougZ6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067876; c=relaxed/simple;
	bh=T15w+mA7PI0yVMrsEdgzW+cxgtYUaIeSuwagds4Ltb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjVZ9xfH0YK0AaaiT6T1usZOyTWY+0kx/0tFZm4Q0U8Nuun31RN16RRTo7zFs0I1TBS54iWugnccpo+SQxSbMx59SNhqt5C8q0AfKMfaZaXd3PwcPYWiC3E4mqfByohLqTSa7J2OsucKA3/nPvIzE1snnfROrdwdtqCcq1Z2Gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnPnstlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qkeyz60b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6299fCna1916479
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 14:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2AIZ1yU4si82pf48ooCI/MJh
	EDORjV/eloMy2PwjdFQ=; b=ZnPnstlNvc9/gMnkQQN+7bHEbMxq49nNA6abbcp8
	44oFADkjHbezMCX6yTVBKMC0M/tSGKVH2kdu6W6z3H/caQ8vU6bM1f3wuxcCDieX
	b26Co6fjCvEENh1TtXnawDFQMF545m5XbQxtdqpJsuqGBXIRVdPcuyISC/jpr84Z
	36byuzeO9xydDajeoKn7UFYzN1mDh4lL1U4dcesePDe5ahGZFbDkxoFSCr7dvs7E
	pn8LGUmPzFTa9/aWMQuDz5pd7vEMbcquUblocYuYlQ9Vz3Lx4el5/D4vrxMiaz0t
	Y63yx8MKQAzop/LfusKGfFOznI+xJvZXW5h484QrKF2pIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6fdrmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:51:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509181cc6ebso4087021cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773067874; x=1773672674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2AIZ1yU4si82pf48ooCI/MJhEDORjV/eloMy2PwjdFQ=;
        b=Qkeyz60bZQpCGARhrMx4XMJIBermqdAxEJth5kTy9o6IVo/L8TuC7A9pnyEMnO1DR+
         ulHDJDw1Ltr77PJqWam0HKdGHXqaoqrnzAbusdNuY6swHXA/yy6UEnMvTsiBGs0I82P7
         j95J0zR4gAQ7THt6AemeHSs7OzFuyqtgNVxWHa6G5hb+LnB0c7UBbQRfxpzRi8Ut3qho
         HiR758QkPqVvrpcUyWmUwl4HBabrnT+KC7eQgTmkUP8zaoau2FRpTIYkCAGywPKP/NL4
         xiTeG1W4/WdbrT4ct8a8L6MZOBrTwA31SWOBmhkfJv/9U51Du8oBEtJTByaOZo8nmzLw
         JMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067874; x=1773672674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AIZ1yU4si82pf48ooCI/MJhEDORjV/eloMy2PwjdFQ=;
        b=RUFegUbQAIX/F2o+7tLnOGKOEKuPV1AxppoOWR2yqpQ2MrTeL2+5FAjfk3lQEAf+Sr
         RGnSyqb5XXkSsDL991tm26uFRTgVjp2qrCCg7egAG/IPiA2kMSnZJi/7ocWBvstrTjEi
         BsCMj1GulUt31c/I6iOXyGNFZLu/2lePc5QAc3LAflRek0xYkEXqf24kFHR/a6hx/75Y
         S6XQBk4FfkWane+ePfTPNn6TYLzqEpk5JdPc/y9CcozkqUFqQUcZbHcdAFz7UVhgV6r9
         4hekhQzBIMXH7gKbl/9A6V1/5yHP/qFtNxj3DcjDeTefGw8QhF4XcaYKLAVZZlOMeWLJ
         8JuA==
X-Forwarded-Encrypted: i=1; AJvYcCWyQp70OC27AlQnPOK52VkZ9zHFjd293TSjDhq4PQrZH5WQNsJull3cjsjWCz1GCDXw6BrEz/4y6rHaCtEe@vger.kernel.org
X-Gm-Message-State: AOJu0Yybd3ROe1lMxUZlYJtyVpzt224CrfHQUwZ4wZnMwjo3wiR5Z6p2
	p39n7LQtSs9PhZnbT6gBtLVbTmcA4+FrRm+xCQymoivsROxwMedG9dR/3ArAsW7beu/XhLQn6y7
	QdoDlSu3Hrt9PA42NvAhV7mfmG0+tC7AJEnv2XJMtLBAzgBuuB74Xv1aohhV9CpW9WrAs
X-Gm-Gg: ATEYQzwigYKm4CkBnIqqgW4lQAlS5Yp7DhFebRY8xgqnTV0FEyFoP6EnOFE4Vtw+jcy
	wz4lq6DVlPKz0r0ok73KbArWBmnadHO9SldHtjtwCcH/uQJ9Nx9NUnOdKvLbi40SS4q5k9AX86E
	7RmzCOIvjyIG4xtk5f8sT4qqjbvXC5V3z2GIztS8NoyflQzfmiSZnyGSdCj1jX2RE9rr2DH0qfA
	vWv4izfhB4tqxDSYWWF1oiCZGb7N8WiTn5ZeRrY0o/x3pMGIX63AQXkSqJLMgnlT8l2b5kq61Jn
	Zfm8QfLbQ/0ZyOcV1689MXCRT/jDPXv9nk0vTiplxbIFpbfFh63vinfcjcA2ULN41/KNYE0PHTI
	n1exXovZuIHIGcZ/AD9gssXpcgHLdmXXyZVw+
X-Received: by 2002:a05:620a:f05:b0:8c6:ac29:7100 with SMTP id af79cd13be357-8cd6d428309mr1361850185a.42.1773067873991;
        Mon, 09 Mar 2026 07:51:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:8c6:ac29:7100 with SMTP id af79cd13be357-8cd6d428309mr1361845985a.42.1773067873405;
        Mon, 09 Mar 2026 07:51:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ece8bsm132206895e9.4.2026.03.09.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:51:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:51:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v3 0/2] arm64: dts: qcom: glymur: Enable SoC-wise
 display and eDP panel on CRD
Message-ID: <whk6dahqx4oda4prn5ek2pglp3kzld46ki3oyrysbvntlu6ev4@yi3jeylmrl4x>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
 <p6ua35deutb2cf63mdciwh46rufnoubaj2ywjeag2ypntm3zmx@fvyg4qztwr3i>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p6ua35deutb2cf63mdciwh46rufnoubaj2ywjeag2ypntm3zmx@fvyg4qztwr3i>
X-Proofpoint-ORIG-GUID: yfLtwkzpQjfbTWNyZHW7rFaUuKtTy3Fs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzMyBTYWx0ZWRfXxc2xqlP/FWwK
 2RKuKITcvZxvz5Y754OtfrhWGxE9+T1rk4NZpyyKv61fpg0BXoV46nkwESpB1kvU8SRcZubrhW+
 XtsWLKc0VOrXBKjMFfmtm61d4JuLrknVuCBiFUGCVdbaGKTrSxn3yL4A787aGGTxuPWnR9GytO/
 mPKzJ+Hi64NWp9Ng59KTGY9Skfkm1EskEYRPDlUPUZI8pJvEBmP5oqcITbm3RhCR7ktHn8pWIRA
 SeOS39SCdA08v5+XI4jluSZbamQDVisl2dgwV3p7bSyQmfUdowPpp82yAAZJZscY/A9kzVNaXns
 wI3MVdzI+U/GKdGqREFz5e3afvQ9qPIPg/mLDi7t3YkyAGtmtO8aTCrWVRQzf0VwSYPkGxCZGXK
 jPO7kAh2WKl8Z7DgZlgnTPVRE1QZPl+JPUWyB2NKCOVm5FXDQJ2pwdCDh/gDlE1UwCdM5PP0GvH
 mLX1ABCUcbeHNC3wP1Q==
X-Proofpoint-GUID: yfLtwkzpQjfbTWNyZHW7rFaUuKtTy3Fs
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69aede63 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=h0Z6viOZhYfkGdC3WjcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090133
X-Rspamd-Queue-Id: DD40C23AF05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96280-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-04 14:56:10, Bjorn Andersson wrote:
> On Tue, Mar 03, 2026 at 12:44:07PM +0200, Abel Vesa wrote:
> > Start by describing the MDSS (Mobile Display SubSystem), the MDP
> > (Mobile Display Processor) and the 4 DisplayPort controllers it brings,
> > then describe the PHY used for eDP and tie up the PHY provided clocks
> > to the Display clock controller.
> > 
> > Do all this in order to enable the eDP panel the CRD comes with.
> > 
> > Sent as an RFT since it was only boot-tested on a remote-only accessible
> > device.
> > 
> 
> This doesn't apply, am I doing something wrong?

I think I messed up the dependencies list. Sorry about that.

Let me respin.

