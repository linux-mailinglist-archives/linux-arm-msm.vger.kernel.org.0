Return-Path: <linux-arm-msm+bounces-99207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INC/It8cwWlaQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:58:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2B2F0AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F5D9302AF0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A343390CB3;
	Mon, 23 Mar 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4YRlTuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dt0qTXS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A06D3914E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263158; cv=none; b=bO1Fs1JDDFLdfcd2+imTPm9CDShjN8v37+70R9UWUdcXgK+mbSW/heur2P90vCMRmrbzmivQMjdzAo1tguUO551y4l2Mk7BFEh2bhPy+iuD7Ghaj3ALj1F2SsjBTMZFWBBRePHtcYSgaEk1rEt3jI0VsiemcEHIbyFCmeoquMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263158; c=relaxed/simple;
	bh=63XuFVU91Dh8SfSSdrM5+ocQ7GwUchBk8bh+oStXhDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tY2wtxZ2pSIdUkd0pX2Yyf6XoSlztD1NSmmQn1b0K5lomMqg5yVW0B0mvpf2VyL2lFgZsSJAcal7Fx4BZGDPUWrWW6S139NM949DG3PJYZ1UmKYlP+ftjLawegnXGafpFXypt+xlZW1k4fMHLFSfkKrE8nvMAoIDwJVlGDwjYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4YRlTuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dt0qTXS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71nP1422006
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=; b=D4YRlTuYV9+HbP+h
	C9qWOHmabtiG/YpE8C44Os+PkPwuSsgv470MvbTLBu1cJLexmJYPMSIymkxm63uX
	TniOOWimoO2GyO9WWQ07OHTMtpESEAFDU/YfHbX6Jwy+JrKd+/0fyQH4H0QoTxPc
	zgJSwZjHRTtcjoZgg3GMjz9WI2WqNpct1N/wywuChvn+8465WHsUouLIeB+hfWi+
	nOaNhy2qD/GiwKWb6WmHRzg8M/duaNFw71B/Tb+rkPzrlvD1+7ma5kMA76DNPgQs
	aFClfIo3KnpktOxBRuqqjDOF6Es/CYodGmy5iGUfwNd5mv3hBRhatZZXmZdk+Isu
	pAH/5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvn2eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:52:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso40722561cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263155; x=1774867955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=Dt0qTXS2bJnydMieQWFDYsGzx1TTEBjfqqeGYnCkfe9JmOR81CoIIHLcaOtc8608au
         qFk/k8lhMNZnYf9qqzZXZ8RIk3JH4G5YYW1KaX6alv/oLVg7sGcFut9lOEMSEW/gKXtA
         h0VwH9GF5dADe3ejP6S+IfG4f2A0UB9LXWunPWizJQPgWkZPBYHdDQ/SBT3DYAdmRHL1
         ViRaKO87ZnOQR2a5DoU53Uk4ZpB4V2zmyGXWe9YhUEVOd3TW+YsakT6jGwI/mMgnvF/0
         mlWIulTVMGYHsFcooNKJDSSqwC67ZjW3ap3xyrFNrDbRbmkItWIoK1SGCsuW1uKCJs2e
         kkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263155; x=1774867955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYGocshpbXFcrfOfvQgf/WesrIOihcHdA5GDk2E3Bzk=;
        b=jhYfkFWpkhK83vh+PLaW9i468Oo7hBNEQ/Onc/qfk1ZC7kUiwyQfHHK7chglYqALCZ
         aLwmwqnCTsMEqhp85Rhf8L7wvVl031rYzu5gG7DTSn9h5/KxqPnlhf6BAEErenQasCl2
         OpB86YX2ipjQvko7aXVdCXQW9gch1m7kT7bs4FXFCF90MNvqXTXDkuB2OhTX9FDtKtaW
         loOo3F9y5Km6RsGioZeZh8WMDJvps4WILr5aCSLvfG6m1O0tuVJB/CliOQ0Qg9jK3RWY
         sC9PtSJIRmcAyRh68nQQIM5AXnilv1inrppLizDAdycnXWA5KLP087HgGeevD3bY1Fde
         Xorg==
X-Forwarded-Encrypted: i=1; AJvYcCVks++rMt4ToH+rZSmPacQjjkc+SCK9Zt3a9EFeJbiCoDDIYKmEJVb9mjzZA43BOnCtxPmhGT1pwXcikOQC@vger.kernel.org
X-Gm-Message-State: AOJu0YyhpDCnDipVqDY1V3HGOMaRRBtWcHeX25tv3zb99rwwPGrsIk1Y
	OUp4FnJI/mmVyWxthxT7NusyKArO8j+tYyU9FjR/diyI8oFoCNxyp/lte4oHLH+4OjrELciDCtj
	wX6T+ImAkgHeTYkSVpcqJ8pRMFQuWexPJKaIMHHQI5T0gcKNqX11xVoMLphrPa0dxGDdo
X-Gm-Gg: ATEYQzzbdF/4gh+B0nOxnftm6Fu2SEX7ghMoayYFQWrekwYPk2dOjj9Hq5I99c9wxBx
	627mhThiJS22aC6W4dD9XdaN6H2V93/7IsWgRye3y+gfUXHBn1Efby6eVGCQ2xB5jsKO06an7T5
	7P+yH3GMEFpEDCq5njlOiCjYr90CAbOn6100UkElP//2ahfwJFx2lMXVSl6QJYEOugu7RaCXXuj
	kdYTdJIv0fdVpTfkbVssiVysFxJv0p7WAd5yajmIXROE5Z3L5pPTPLzjN52y0IOA2xjlYor731k
	em3gvFQtGFC+wKFNWo6Im0Y5Nr6Wyn3A0103P8czKmFnQnqXqaHS/VdU8AsVXZveMQq+eAYPNsU
	XxMH1SPVo9xzG8pulMXsKuzu8dBFb1zJQFawe99e5QeVIcfPFoCe7936EnmeMe1pr60APq/g1bX
	tprpE=
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536461cf.1.1774263155415;
        Mon, 23 Mar 2026 03:52:35 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137536351cf.1.1774263154936;
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871a44sm484502966b.56.2026.03.23.03.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:52:34 -0700 (PDT)
Message-ID: <109d21b4-5d16-4689-8383-ecd29bbbf8a6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:52:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX4ZWlPQ0yABzL
 LBC/RiIGmR7qeowpsPOlfJq6RdsRegGWiRXaLDWphs2N538lwZkvkvDJawBsdZ3ev0E4fyYofEk
 DGQbu3vtKGfKlkz+j8jxe+Rvrygb9TyFYeCwuVKnHshMORW0g3eyXlZn4F0myTT5JBLhG2KeZTq
 A8GFpC6L24weqHF1G1fgt6SS8ONRw3fQRT3S1hXfzpTzuiTKNqKwRs2EF5I9I6lSUZSa4k5WXE0
 LhVTcLKhllK9IMAIyf6aUrsUqfbaLXL33uMMpyFgSDOELDbpJS6757Dr2v6C+8tmfhjcYoJapW1
 oxlYfYcwuRETUztjS0XrhPqX1lM6tnpd3FH+SDMbyugvxc97pIcMjRJ059gwRkrvHR3XqPNOO0G
 OJvcXk9Ewdbj07MFpdXoKaYNXkQHbVQNF4Iift2+bUi79xvysGAf2YDnUUDPPf2uyMyt+YJsRfg
 MxCAUxIacA1cU3E5uGg==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c11b74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=sfOm8-O8AAAA:8 a=4mdWWUweJ5RzV2WhxXkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: lUF--EV0D4Ekiy4TEYym6_0SBYGV48Iy
X-Proofpoint-GUID: lUF--EV0D4Ekiy4TEYym6_0SBYGV48Iy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99207-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,protonmail.com:email];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EED2B2F0AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 5:23 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +	panel_default: panel-default-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

This says "by default, actively drive the pin not to reset the display
panel". Is this actually necessary?

Konrad

