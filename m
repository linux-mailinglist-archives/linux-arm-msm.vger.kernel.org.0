Return-Path: <linux-arm-msm+bounces-109546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMfEMo3QE2oOGQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:31:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C05C5ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E439B300A8D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 04:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B7526C3B0;
	Mon, 25 May 2026 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT9Elm2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXd86NO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B331DED40
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779683463; cv=none; b=hkbt/bHr0eTnIGHA1JGRMITBsCpW/pMAkVdexw0oaRWHSf6CcArpHAkzAkQe+ZLhIuZyiLXCBYKLptTEFuLf7BwrLEdm+/StyqgyQOezQkl/3eijhF/YUhOBPBzeMYrdlQaLD3KbyfqhXnLvLHHLVZuU4QJ102LumCPRHJlNsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779683463; c=relaxed/simple;
	bh=M1gGZpcyb3m6+igNJ5Wnv/Ed5IcDZBWwh68gCIMAliQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWaPBmmmn/Hig5K9syl+ZGDZM76bpvIU27PMpBElJglf1L62NWIt1WWsmd3/USIMONZJSX5XSALRvIH77u3ySdU5wYi5djCITmfHRy/bdgcJBCzvmaDWC08WBBkyVoyrtH3wYy/MPR1SrSW8PqL9SN61gXJ9VRK+wPRsEVioHM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT9Elm2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXd86NO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJ7efg236109
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mxjdMdjm8PaT+eqqOGCHzcPe
	adgwQpwbfRtAgKRaHOw=; b=AT9Elm2r7QCXC13qx08/tQKxThiLLXAHD1t218/K
	FF4fA0BdZjNMhD4LNz2+x2WsqykZna9hu1z9kjagUIDs+Ayv8pxjmkYMnT/o4yba
	isFwYIuDRqrYU+vuac5+NCgYUWPBxjAq9Pwd/k+WyPV9edzmWIwIhoAjL55KZPOZ
	JMHtR7aFFnoA0Jd21TU1/t3oGE0D9rdEJbtSfp3rcr+CneotrRXGQaqtE3hK9uk9
	vUde1btzxtQjqjZfCRGVkpj8jxxCPkEOs/dR2rRSCLpOobgi4w6EEp/4LlgLUoGE
	yG7M/ntQxh+mv1VWuGPykqJVSudP6OZUYloZcfTk8AmjIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9mqjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:31:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso1481061eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 21:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779683460; x=1780288260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxjdMdjm8PaT+eqqOGCHzcPeadgwQpwbfRtAgKRaHOw=;
        b=AXd86NO2biX46SvFyChy4Klxz4KCdpUGu+qgtJFwm/LdfzH2lB2Ul1N9NC1I7D6n5c
         1oLtTQ9TKjLDaYiV84n8pJST280EA2z0cTKkRS2SLs+GQ5QZ094uAB6wOkMnj4JL8m0o
         Zt7I8LSFbHQ7mTvwMG079czii0G3KJyecOzRnuYC1tnPuha1BaqVmS39oN7jdAlNWKl0
         uw5jTeMUWjmp6AJGUsGPbLx9VntFGF9UcBhIKNZrcq4R7cdif55mo2esL/8K/5yitqlG
         VDYWn9d4F2bxlePCY3n0tJa4NE6AUZQb1tu7S5/BMmTrEcbn7TGdmXE3y3U29N8Z5GVz
         0X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779683460; x=1780288260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxjdMdjm8PaT+eqqOGCHzcPeadgwQpwbfRtAgKRaHOw=;
        b=V6i5gWgMrMdVpJucOPfvEi0SOXfahJiGV+HJudwa7G+Rgz0O1AMBTIRJL+T5GvNKBZ
         62gqwlqDCQm/OVMN0yOofgeQZfz4hOv4nUtha5ftU+IXUXtz/N62lg2ujWLuWWGp7Lsc
         S4H7bTuiJ4zmWLAaQbKR3c8XmnwIbL1wIwXMfrlBD9+d78S8EtGgsNt7ZlBkFdgR3Ukp
         ckU/q8zr1zUgK5/fdTGXaw/kvab4xVzCCzXpLwccZefgceFTf6Z8ceerGeVxKwIngmWc
         Xl23Luh87FO95sM6WXbcwxjE5j1ejWpnDW/k36gbQ3nux4+I7Sg4xpi98b4QkG18ikEI
         O1eA==
X-Forwarded-Encrypted: i=1; AFNElJ9vxgn9B0L2/jWdOURNCpIq2Tac1Jt0i8AVpwV9uNDpAZSsK/0zEX5AtIh63u4Z77Uo6zEJWX0uKlrbfjoB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Be1Xw0RtViJHT5EPSulRNGxLvVdt0XiKSghveSblTmAbh+er
	DT57NbDxwDXKoUgb8XHFi5x9Nh0Ju+ytgHNsoQ+3vM5si1/0a5p5UBtgPP2jROLempJnvZGPaTy
	BWy0LHY2pGnPXpc3sDSEroU2gmPdPsMLDyMV5xNIw0uRGxg4PvSXKOdAMzCnJk7KKo3Ly
X-Gm-Gg: Acq92OFSA6ahtfcu2QTVc8LuE/7NC9jE5+gMOtvTKcyNqbszpnq76h1cFcDCwVATt1A
	zFv7vzLxHXLQNIzH5NL/He5jQW9CjkvbG2bZZIjiX5u7E5+P5iQP9gC17aqkOmbdH+859gH7+3V
	9Yn4nsMZ3G+NsuoRfiNqZkBmyRrRbq3kWvDQWSW3Ky9Ldn5yhF1Ayc7Bf+PMQb2PIpxR7scHDNG
	GbMH+xIxGvbFulGoRlSTaGye/IgxLeWygkD0dEqKOumFHiOujcBSMW2PjKV5Cb3BP7zDOMJIB9K
	cYN292Wk+OwIoY9DvoZiOGvhijketc4tnYerLYa370gpsy3Ba/LizkpqSI+52+kE8cPexJ0lAFL
	m19a7OQuDs67jcJA2pe3lHbBWrYFPMGQ5trfICJWBOxetwY9/FMqlAnx+NUNNzxYM
X-Received: by 2002:a05:7300:ef83:b0:2ed:e17:d510 with SMTP id 5a478bee46e88-304492015bamr6255518eec.35.1779683459674;
        Sun, 24 May 2026 21:30:59 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:2ed:e17:d510 with SMTP id 5a478bee46e88-304492015bamr6255489eec.35.1779683459061;
        Sun, 24 May 2026 21:30:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30481ad4cd3sm2532345eec.27.2026.05.24.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:30:58 -0700 (PDT)
Date: Mon, 25 May 2026 12:30:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ahPQe8cUihXa_lVD@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahBG6jKYdSAboWjs@linaro.org>
X-Proofpoint-ORIG-GUID: nuNx3nPRO8CrNzK1vQnBI8qv0ayKT9GO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA0MCBTYWx0ZWRfX7FOW7Zdf/yCM
 mxPVaPEsihIGcIEkTFoOCvNmOz3Oc3T9c6gRIZgLXbQ8SEYWacNo6IXP7B5f6ZvOekBFp8VvjYI
 /i5yGrVIJ2Akzvq6Qqb3v3IRfvAIB4GzbqNWt4K3bxXlKn7+/UzJNou3zq+h4if5a2eplvzs/q/
 RkmCKC4/O4jlsByDR9PvpNL40QmU1PqGo8heuP94sWgRzHNirV9BkKrXcycePSYEWPwsCSHC0Qd
 ZaCk9csAn5vXN7WqPVUpAHE0Wuy6RzwWHA+qNwo8ETHul2JKf+OQTZPczFkU7LMAg1/8mz5jile
 NOyfg+tAsCd6ZbTbZpBjgTJVy27Y9Al2J14AYK7pIWj2G8al/BxmNHCEJCnPcB6UaDleB+cP3Yl
 MXBK6KI7WTiVHgPXlBn0bPNhjeoe9QOD10GSTUQ0DKwgrkosIGPbbIk3/PkgCX2WvQ7VX1a9zVY
 +1CzNcnuiq1S0lx9E5g==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13d084 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NTgEU9xG2j4T_9ohbxkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nuNx3nPRO8CrNzK1vQnBI8qv0ayKT9GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250040
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109546-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 339C05C5ACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Stephan,

Thank you for your great input!

On Fri, May 22, 2026 at 02:07:06PM +0200, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits.
> > 
> > A new qcom_pas_attach() function is introduced. if a crash state is
> > detected for the subsystem, rproc_report_crash() is called. If the ready
> > state is detected, it will be marked as "attached", otherwise it could
> > be the early boot feature is not supported by other entities. In this
> > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > can load the firmware and start the remoteproc.
> > 
> > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Unfortunately, removing the ping-pong functionality that was present in
> previous patch versions makes the whole mechanism a lot more fragile.

We are not discarding ping-pong functionality but would like to support
it as a second step, because it's not supported by all remote processors
these days, e.g. Nord ADSPs are brought out of reset by XBL but it doesn't
support pong.

> I'm not entirely sure if this has changed in SMP2P v2 or more recent
> firmware versions, but in my experience the SMP2P "ready" bit does not
> tell you if the remoteproc is actually running. The problem is that the
> "ready" bit is asserted by the remoteproc when the firmware is ready,
> but it is not cleared when you shutdown or forcibly stop the remoteproc.
> 
> If this is still the case, you can easily reproduce that with the
> following test:
> 
>  1. Start the system as usual and let it attach the remoteproc
>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>  3. modprobe -r qcom_q6v5_pas
>  4. modprobe qcom_q6v5_pas
>  5. If the "ready" bit is still set, the driver will try attaching the
>     remoteproc, but it's actually not running. No recovery will happen.

Indeed! I can reproduce the buggy state with Nord ADSP.

> In this situation, it is very difficult to detect the correct remoteproc
> state without relying on an additional query mechanism like the
> ping-pong feature.
> 
> You can make it a bit more reliable if you also check the status of the
> "stop-ack" bit. This would tell you if the remoteproc was cleanly
> stopped with the SMP2P "stop" mechanism. However, that will typically
> still not fix the case above since nowadays remoteprocs are typically
> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> case. I believe this might set the separate "shutdown-ack" bit though
> that is described for some SoCs, I never finished testing that.

You are right! Per my testing on Nord ADSP, stop-ack is not set in any
way, but shutdown-ack is set via sysmon with ssctl_request_shutdown()
call. So a check on shutdown-ack during probe would be helpful for remote
processors like Nord ADSP.

> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> tell you if the remoteproc was forcibly killed using
> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> solution would be querying the PAS API to tell us if the remoteproc is
> actively running, but the last time I checked I was unfortunately not
> able to find a documented call that would tell us that.

I agree with you!

Thanks,
Shawn

