Return-Path: <linux-arm-msm+bounces-97926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGorEZXmt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:16:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5129892A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DEB2301BA66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A591289E06;
	Mon, 16 Mar 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT9zdv3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="He/rN9Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06142286D5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659794; cv=none; b=laBVTiw5h0h8IR9Y/U/rv05WlG700EEHavj+EItY8NOL6Los2nrDws2MvqM8MD7XTuFNOmHTzM0p+Qc3JPzv/qCUI1K6aUyzInUyAt3cHW7SfY50ZjPqtV6agXajSIaogYIe16BAFEGlHMJm7VDSq2PIyJhwel+6F/sQax6iHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659794; c=relaxed/simple;
	bh=xG/QaDUSOhesRdmqYi6i+Ld8v3fKnFkYqZVWHVNXY3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOP2mrtrJk3y//cLvaIDcMXZ7v/kiHZLUkUfTnW1NkD7KvV2iVCCLiWaeoE0h2GN88/pc8YDWFDr2h2y+HNccDagh8vRb5wX31gF41bIOeIHM1u1VGqBzfAE4rMgG64Bqo30asPDEYghl9+0vpUVEjc8AIDej/gJ3HE0alBasn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT9zdv3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=He/rN9Hj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fw11282126
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YDE7D97huJARZebmKe+OloJlAk/ia60u5iSeajG+rk=; b=cT9zdv3/LsiK0XOn
	e7DvD3I6uHY3osqlO3yW4WM1DNHhrt9ivqErNILqLdqrcc3HlbpYqebd1yyDxoDw
	thmpW5OA+Kcp1XdQJwWEp996Eg9qFvPF6uF//ba2oOmk/pEKkJIpgp80QR4O9CAy
	J2aHLoEYQLli9hhzamv8mK43lNUrS3PBDOgyresS23A0sgqL+0Fzd/sVPr96gMJa
	yunxfvbJ43lwyHlqAL92D+0LlTaUbEiuJaxpJ3q39Ji7W+HjbLnBaR/GbGdfnpFm
	Xl9m/2CpJzA+wdVPTJ6CcBVjuU7m8BCeuf1EwUXRz4dyr1geJ9DbDT77Mdliw3Bn
	MNvdGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5ab0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:16:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4cde1f02so9848886d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659790; x=1774264590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YDE7D97huJARZebmKe+OloJlAk/ia60u5iSeajG+rk=;
        b=He/rN9HjRVo1ipfxWsY/CryucRe9OCq50Q1yo8It//Nq8jIWcHQ5Bol0HOx4pEzKHx
         UTgxkh0ys5EIOKsrq/mtzIexk2eIrkm/GgGqAU2ntYAkSKAA3ewcexF7rL20ku6JmzVA
         IbFHHAaQZXVWoXpcPsu3N+Hisn/Zx64Fnn/L0pFHH4Ld+g62mZooZhrdIC7aH5nArxz7
         sp5WsOUKe2zDwJ0CKa7Vr1Dg4ZOE5kRsSCmHxJzTZcghBrd8m7KZRfHBLaE8CDzGinYE
         zfBnPThx/19hYJcBdEVVv41Nornopw0UYZaa9Co610ADneRvL0AGnPoHf3Ivc/dvk/nq
         YEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659790; x=1774264590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YDE7D97huJARZebmKe+OloJlAk/ia60u5iSeajG+rk=;
        b=diUmVYAfMR09fvPsZjhl0cF/6bIKSgoj4AaAR5qMvWQ7Z/UsxXz7mJk0vJI9U8ZnDA
         t1hmmLeLIu8i21B4+ZjM/ZYBWAXklPoF3VqLx1ODvpnQspqYndh3TT/hfxwU5pmhq5Cp
         DIUgKUe8RgzAyWarAvSux+8TCUMCJUqz9blZjhNSQt/3glhP/Yt4T02oNfH1Yor3bQBM
         /kFfl80KROxRwq4168AA1jBTsFQbIxhcABr8/eYnYz3L3l6S15Wi3a/TX/yBFUBXfNyF
         1d2Z2wYHuLXb25eWHmYt5gxfEQc+s/N5nDo8cIEfTyasjpmYG7Ut4ILBSPU9GBsnEEdt
         HuLQ==
X-Gm-Message-State: AOJu0Yza6wftDmV03LpLtihuToCkBOHgl6rlavqvc5U37cEw1E+2Xjvd
	GHMuxjEmfeOG5RXq+ujNyUzxuVaExy91JMxHnEYwo/WVRRKXchL/uCKUHzTpJS522kdSByXaXcW
	UvjAiBMYoRfLir2vI/O1ADmghwPs+ox2vkifYmwX/3Xr8SlxlD8FkyE17iODyVR4j7Nct
X-Gm-Gg: ATEYQzzOEeo9k2hwjbsUWVZoBkBWPnc1iIrdphchpnIL1abzf9Gk57Il8PHE4lLlre/
	9rjCmSwvz4Xkh1raXm7O9Dt0x93XtzSpquvozfx6ApMTslFeBSAnxg7VQSoC03e2LQvoJ1kReoD
	PBLgQmkS+CtzPN0ZpJtvcdhIpgt7L9Siju6H6cxlfaCGF/l7PkAiqggMzfsKIH3gyNvvum/BlWI
	LctCHbJsUhkrChWox/0Y+kT/lTT1r9t7WYZlJJwLVhKfHmggC6EBbXZIy1DgX/K4tKXekXQRWrD
	2Am2Pmw88B2s3fQHEQ7d4UVBBXjbHAVrLtQx5mV9L4xXnYV69IhzzdPROCaNqd3f+OPQJK+Eqja
	fiPVsDFO5oc+KFROILF4ZTBZG80q29+lUkTftDtPOAdniadmmY7FUtphDpaj2/7o8DRTguzzqOK
	qeI4E=
X-Received: by 2002:a05:620a:bc4:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cdb5b8cb21mr1296898785a.7.1773659790156;
        Mon, 16 Mar 2026 04:16:30 -0700 (PDT)
X-Received: by 2002:a05:620a:bc4:b0:8cd:8751:2b19 with SMTP id af79cd13be357-8cdb5b8cb21mr1296894485a.7.1773659789695;
        Mon, 16 Mar 2026 04:16:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb47fasm520697266b.43.2026.03.16.04.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:16:28 -0700 (PDT)
Message-ID: <c404887b-ccc2-4731-a7fb-2e37ffbbaf3f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:16:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: hamoa: Move PCIe PERST and Wake
 GPIOs to port nodes
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313094618.1361418-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7e68f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hNqFj29UGYf0a7zNkJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gDxJAVj3M7WEmRGLZTEQtudtyyoAVzDo
X-Proofpoint-ORIG-GUID: gDxJAVj3M7WEmRGLZTEQtudtyyoAVzDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NiBTYWx0ZWRfX0bciFxOgJLVg
 +FtkPfQLGXVwr4U8viLYPmnW6vyrTC0/BCvcu1KqOSWbB+ncJ/O1FO1okrPA7cfo2W2Ka7HxdCq
 pB6XrLtt3DMupEfbRje3JqmW98xAEjVfC16xzf4SO9ylbF/ytjgcS5k9pvd/zekPPJNl9xWEam7
 +MHEQvN0tcwu/mwi/e2d444G+7vptwBaRu8EnVnEL6iq23/koGukvUaHdJ+/t4p8y9yEWfVDOEz
 SvDtvSAFg93PAywvvzhlcAJyUFnlGjNfW/b9ifh+5UFZxlBxgZHvol1gshi7s3ZQ+H6IFKur2b1
 yRLFxPYdq4B2a6hvubgO2IrheJG9dO+mhBUgCC0QErq/FGTHl6HFodNuMN+XNmErjv5MYmWpjDE
 znHeeKiu+aimsnYMsd5M9LhWAEYuvKVb5ukqR93Ay30Lm4TBNeTesDrGnJBnRMFZA387lT8kmys
 5kyEtVHC8ZNum1jd03A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97926-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,linaro.org,linux.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2D5129892A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 10:46 AM, Ziyue Zhang wrote:
> Commit 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake
> GPIOs to PCIe port nodes and add port Nodes for all PCIe ports") did not
> convert all Hamoa‑based platforms to the new method of defining PERST and
> Wake GPIOs in the PCIe root port nodes.
> 
> Without the change PCIe probe will fail. The probe failure happens because
> the PHY stays in the controller node while the PERST/Wake GPIOs were moved
> to the port nodes.
> 
> This fixes probe failures seen on the following platforms:
>  - x1-hp-omnibook-x14
>  - x1-microsoft-denali
>  - x1e80100-lenovo-yoga-slim7x
>  - x1e80100-medion-sprchrgd-14-s1
>  - x1p42100-lenovo-thinkbook-16
>  - x1-asus-zenbook-a14
>  - x1-crd
>  - x1-dell-thena
> 
> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

