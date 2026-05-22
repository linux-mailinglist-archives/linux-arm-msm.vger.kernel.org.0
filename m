Return-Path: <linux-arm-msm+bounces-109278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHbqOexBEGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:45:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA995B3341
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD3D530536E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373F23D2A1;
	Fri, 22 May 2026 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4wwpGjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtajVQnm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79D93CBE6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449623; cv=none; b=n5UdIewdFGqnalNGtdFLhsbVSkCLAoqB6uA2mxuC3gvTiN8wgemfS3YbR5NrMmY1JMjQPhaNf43Y4On2OSDVsQ/jZNLvrT0Ezzb0bamNHI28dLTMbfcyN/KaT7VHEdfBNaHWi35slpZKuJ7dfd1TqG6fvVTI8dDnwSPfpPP1vMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449623; c=relaxed/simple;
	bh=xs8tAVUvyZuYREHnKfgtLrtnEMTzHR/5bj0iKtqvimY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Md2eWRqIevA0kpijdS44IA5Zh4RVTEWuhj1vtiHX5B97/dbmL2M/nExHTH0/phTREfRv1z7nrVCj9FoPzuErFiuf5h/cS7mBJmexTa8bN9TDmwIqfe/UYbpZ+HWDNgrvJE2zbz2fKzBV7KzMennNcBH1/8m+RJEZWy9PZ4F69ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4wwpGjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtajVQnm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8W0NB399163
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tPpYvChL3EWA1u+ZY08kAo16G7ygyNesByzCgdPUwc=; b=Y4wwpGjL4+3LkpmO
	y9/qwytBOw+X4WEXAnI3uN9NlAyn/MMEhV3enwEG1xASAouyaJkxH5so1Ze1kJLI
	8xd6cpm7bXyD1nkTgMmG4FwqrgjHxLjVTByr1vaPrPo+0uqH+xM9pY9tIqtALiW9
	AigD5k/xAP6j6Slt48+EustPvbvUguXkr5H5TpcxK2dYG/qjwA8SFBkOxGk5ERuQ
	BUU0fTd+/naSRs8HTbVApM2Y/wCLQRHPc9YR+94cnUHeCndX6RAzIB7qAH+ZMLXm
	c40ff65YuW8d9GRZfYPvi3G2yB0Bjr+Y6GSq7hzZTz3SMeAVVTVumYfgnDlkoitz
	XT+UMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9v2va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:33:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914ae262b06so36846785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449620; x=1780054420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tPpYvChL3EWA1u+ZY08kAo16G7ygyNesByzCgdPUwc=;
        b=OtajVQnmz7NRxewSVe7l7ka9pX9yFk4bKt/9QlFhoFGvtc+PoKBNBNiBhSbAsuctbi
         Te6geeB1TN1fO73FblxB79DlL4VFSOefUY7oiRPiSbJ0FtE2RHhtZ4aY4txJnWT+RHfa
         BkUzoJ8/b6spwpnbv1KKNSVQa9T4mWdl2p7ApSck2TOYcTsGmbnENEbhEM2mAxWmo5V0
         U5bo6NdxCpgCXPAdXwAaEjLn+McREy5IcpWDr84bTSC+zHC50xTJysk3yglM3R2kmyH2
         OhycMuBahrTbxjqE2JwlZCittTqPgB0mo/wHe7+U0E/ux5GVxiddn/ajLu9madrqNkq+
         G/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449620; x=1780054420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tPpYvChL3EWA1u+ZY08kAo16G7ygyNesByzCgdPUwc=;
        b=SkNTyuyPHdCOVf7fCabOM8P6suwUP9eLI/mR2tQbFY9fh2GKlkvpiLxGIVmH0mbN/n
         jq4ap/RuVzSVTAsJ9d3MQBl23eXJdVwGuQaIoJoQpBLoeQ69yC0euI7AsgKWLhAVCPLg
         vvEmDnkozajW6Co3rBR70WwUI3iJy1PkW5aPJACDTdoo9on5kXmv64zjfiSGqNl23XNK
         lA8mbuwOEv0Z+Sl4IqbCzOZndmbI+VOQ87nrv8Re72CydCwpK0VojpRhgivcDH+7Nf77
         6rLAD15y8biyBmgQtbQSShQSjaTa3rELTxDKazQT2E5DD7gCzpFcDMYas5SJ/Pm3S4f5
         T+Dw==
X-Gm-Message-State: AOJu0YxA/CyyFUJ5xpi5jGpOAyPvaPfHPCYWyc+0KLvneNBSuh+knk3G
	Po1hXMgvxOMxgjvC2/6t3m2rlTRrmcRUjoALscCHMLRMBXC7Pnzb0AEolQIoPto477UNUV1U1cI
	PC0gmTfGaY5xHn2Taxv6lH/Sga37IQjmwx4ysrKpIcxVGAJPfZJHQkKr+4ciuzJMUGcrg
X-Gm-Gg: Acq92OEnzs5xUf6/j65rxJAUUskFuIO63gusasN8yGW0ABWwto0NG3t3p/hpgLh9JEn
	Ct0Ny3tSvNOrBNOc8cO8uPw/rf5gjQIhkTIOzmod9fEeBH3NdRo0RZ0Hwznae1OOD2fVVBJDw93
	HTYjkzM5k9xYbmWF4pP3TOMF4ypGV1aAn8qApP+0+NQ+NBg6mZcuoF9WbyOD8trm8hx26XNYjg8
	7gJHb7yFrtp4y4c0voNWjaLRhRYa2v2CPd6/SllrOAK+HJy2iQd9qhKLoFAdATMYydGDXZl7/Va
	m9dg338OoK508+JIbVRUdUPymzk+TcEFDS/oaAArVeUTbt1uKkOcFXH63eg+OqyIYVatst53kjT
	migZ1o4eqfg2dngxn6PbdqIEcikDMe+Hr0dYXxHJ3CWNjVw==
X-Received: by 2002:a05:620a:690f:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914b4a59f89mr315524985a.8.1779449620219;
        Fri, 22 May 2026 04:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:690f:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914b4a59f89mr315521285a.8.1779449619725;
        Fri, 22 May 2026 04:33:39 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d334sm580222a12.2.2026.05.22.04.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:33:38 -0700 (PDT)
Message-ID: <32e8eb9b-b365-4123-841a-823e41c50235@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/msm/dp: Move link training to
 atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a103f15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=UhmnXqIqSmzi-CRdO7cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YRlUe8PcGyZub5uveZuQKuwoURPkolxQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNSBTYWx0ZWRfXxFkyvM/C/JDT
 kYB0xW7Ow/kNoOtZaVT2aPwyaXNN/G1WkiBtdq+9ToHFwRQfZ6Ki/4ucTaxhnInJWMNuW4zEchc
 /oXuSnl3MMavuAeJH9tW+s5Kem/c0zOgL5Mxd7nXvCwlHivJ485Bgdacb4t3aJcZQScogzeCcHy
 9ykNjMtRG80P/7VHs6aGVc1bVEqOQ9JJHqwQsG3tj1B3wuVjiKjbMcYZrhHKZPy01fQ2AjUEVoo
 waKFPUf6NuDTT2Q3vL1SI1wlCYd0Nw3/Qpr9zXxUgbil91BrN6z0OkHN1LzVU7QRoZ914/ucm5k
 9oIVea83mTqeqKsARTWGEMti3dMzUicUiFc2w6UrrI6axY5D4Eda1TrOqkkhs2Z3TGQ4jPIwwX9
 Yh2Gehhnzr6C5pJTVhEtpwxcU5N9w0nJCOmBeSmR33LiwdYo9zYfl1IOZpjem4L0L7JrC+iTJbX
 zL8bAkvY8y2QLoAU8vA==
X-Proofpoint-ORIG-GUID: YRlUe8PcGyZub5uveZuQKuwoURPkolxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109278-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDA995B3341
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.

This part of the commit message seems to still not apply

Konrad

