Return-Path: <linux-arm-msm+bounces-93261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGSqIXOblWmsSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:58:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3494155B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 11:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A263007F66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BDA302CD9;
	Wed, 18 Feb 2026 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muoeLrI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESWMCjqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6527713
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412336; cv=none; b=YQZU5ggJXx2/X/wuDZ3bBUjtqDJKHzjLrgeEYd2WXSfV9Qg3mQ65FRNDEaPd3ts/XUVz6T1ZgNuEflAPWeSBPbdKHv/MfVUPt7pfXkoscLYA/e09x0VZjON2x7e3rEBASexWEc2txy8hy1fsrlcG3jMdDajKo5//ghfMCEB8oy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412336; c=relaxed/simple;
	bh=lAMpc5BX/wnz1RTggqIwJFiH1OLTbicAhaaZo7vdaN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXqiBrHvki8DzQuETbvFxAmg5Dlu6LxY3ddPHTgEFfA8zRrplTQJxcyzHdDp92oo6m9mjrtNTNyyg34Vo18bN8sULjwAzsLhxRAW469Tov5ud7UoS3zXvNyk2YoHsdY3WObLeZ7ELDPuwpie5sTnTLMIIcHl2xzxk6aAj2FJbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muoeLrI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESWMCjqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8XAtw3379848
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTsBt5a0VaXLPvQkXmwtAzHaEXpR+5wnJCfbUcQoLYo=; b=muoeLrI6i4dtbvG0
	/OqaK9BGG5QtWfSUaJLk/whAutpzfPELfTOf+l1V/gIx+Zrx94eCz/M/ynjURJO8
	e7HA09S08kUMqk0z1qoNZrmB6epyAf8SjWsJxBBSwMDEW5VfZgOGYEu5Cg5nfCo8
	un73jJynTrd9yMbCvEOA3++FujRsyAiAD6T9SmHuGUDQ7njj8prwgLN05LNTzn/S
	W3lZ8T34vE06y8Ft2JXJvKzKClK+OoHCGj02kyYePozV1aN+UWmnmoVtMeldafWv
	9x0wh97EsgoTiOQkXC696gf6ISJFfFuuO9QA/qgaI8AdmjdATxI5w+G8HNJ9mErE
	cZjOXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyj4hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:58:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894a207e7cdso38984256d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771412334; x=1772017134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTsBt5a0VaXLPvQkXmwtAzHaEXpR+5wnJCfbUcQoLYo=;
        b=ESWMCjqOM0grH5WyzZdOE4ZbWJy6KeqBuFKnTAeA0nvRf1imnrSGYHv3XavsDIl0ez
         Y4M2+eiTATvgapykXsonnMcVJBRMsV6CsoeJs3xsFvz0nBMWhfHFTs9ukibOW91Qob41
         lpAqDDSq0UiprcaYWY2y2plL0K0w8B/mtmGkBvEUP+i+QgxrPymk1imb/Hqh68nmut54
         652B0VmeVoVptTJZyxqNsTJAeP4lhJOeEidCXKoMhYL0yAkmWTUwjpJA28DsDfbPOBr9
         Luqnt5HK803kofqqSZcCU0QWfey4Uiwwo61htkx3+DF2DuXMRTKDDb/9CV/DUfpQUP42
         8jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412334; x=1772017134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTsBt5a0VaXLPvQkXmwtAzHaEXpR+5wnJCfbUcQoLYo=;
        b=VOTdasbiHPbfa24bRpZJM3GuPA/5GmznUYDEpoyb422WFb9L3AjkTahHPhr2w69Pbz
         dSV0I1UAEML6YG126cByZFgO0/uWIZNpcmSMpGH8ewMU+JovzL3NZJUbha0ASgY0QyhP
         7Fu2J57m+aV3fshTSgbhD3pUv+QpT1TqzXKwBrefdnHoXJdh+0DoaUcK6HHfmxuSrdub
         /Cm3VfG+a00MJh7Hu01+qFCL8FNpbW9adO8/7PcIOlONDI5wGi1oD5NajtkBJ6KXeurW
         n8Sblpp+MfY3VniPvs1UzW0WTNUp73WHhKuS1Gv89vlmrSB+2b8XNZpZYUlJTqssJi3/
         dZ1A==
X-Gm-Message-State: AOJu0Yx1bXfc3iKa0+1i6xIpfwwvc6gfurAzyVq7tqs1LykMIw6XCLDw
	l8Pe8dunLur0Gh4sMu/tALHKPk2lwvNgN6PgCCL+DZ901vZiNORlWypkKcdXLCYdJSaezYU6sea
	fu5/B/wpo1A6bStN84g/J+yGX4TuiGYWwJuDTOa2/Hse0XjkFFIAC0h/vKkJ+rUSBM2kW
X-Gm-Gg: AZuq6aI3AtV0aj1dyIzZ6/M9qmKw/Vub1ctbBqqgbodWMUAUW6Hg1ryWmZbPNNCL53v
	ju44Wz2XYtd0ixCNh2VZ+Cb7aVSSpxZHDJxAk9xYDnoVvm0Cyy5LVypwzHgciM87aIuJxmnI2aI
	LUVY5cMrgFthwa8sBG81uk1oLEleMF9H7LkZfClaHkVipSscymJbcu7F8n7dbsRdb15sUyoyxnY
	vyWiiiqyMHHKQVENarksaycCcFi4/ZqqtfWXeQGekngRveVvbXNAnsb71M0R9WuOkwKoFgZmoT9
	WNFMmQkBDD9iwPM6LIMBv2kHKzODtsjAGrnzJi19ZMuW5ojYO+1nLfQlebwX0lZ71ZprXkQbDDF
	ge35D2kSUWxWBlpW2wN1+H7Z1MMpH5CGHRUaXFHA7O9BpMiBVnzneB0q8QvRFdDrKsgIdOly0hQ
	uL0i4=
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr187484576d6.0.1771412333902;
        Wed, 18 Feb 2026 02:58:53 -0800 (PST)
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr187484476d6.0.1771412333513;
        Wed, 18 Feb 2026 02:58:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fcb0ab637sm413859266b.39.2026.02.18.02.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 02:58:52 -0800 (PST)
Message-ID: <018f19ff-84d2-442f-8d6a-88e05d2428d8@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:58:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: m31-eusb2: clear PLL_EN during init
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260217201130.2804550-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217201130.2804550-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OR4FPGBmaWaMJuNzcVTjhDXgq8ZICfcl
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=69959b6e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sq7H2pQaWTqN_k3XZF8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: OR4FPGBmaWaMJuNzcVTjhDXgq8ZICfcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NyBTYWx0ZWRfXz3KiIRD8lXti
 ywHblpDDKAwpb9bPUn+PW6f2b65cCIAQe3uAFWWhSO6GIhdATc9UeArdhRxK5bWSvGzbTLGL/Tu
 lIm4bNvnHfV9jhg7IVFSxFnf/ufyzsQ4w6aGjF1kP+84ANOUW7mBtMyfn1OGZ2bZEQe0mI9FNWr
 EeBkV9JAMWACm17gM0DfvMvhFvgk/4OpEb/KyLUl3ONRqOH1uau/B2N43Jwzfy75McUNDxEAY7L
 ofY0Gh+/bGKrl3szuV/x9ohE1Y9khYfoP/k558O2g1PEgtcPWeiee+rJqIydy6MdWRChNm9mXGO
 ng2mu9vN9Ut37Uh6n+cUCkyQRbGf7+o/OXW6l5dOTPIM0Q5PO270j7vU6Sfe1S2j6G1QqsIAM4q
 Up23konp2ErMbYJA7DMwrAMHb5VPZUEphpFFPfBU0+rTKnbZw+5+kDzwFGpkYB5rPrlIMR5oS0u
 O4qfG+TykXU8JKkvgDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93261-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3494155B7E
X-Rspamd-Action: no action

On 2/17/26 9:11 PM, Elson Serrao wrote:
> The driver currently sets bit 0 of USB_PHY_CFG1 (PLL_EN) during PHY
> initialization. According to the M31 EUSB2 PHY hardware documentation,
> this bit is intended only for test/debug scenarios and does not control
> mission mode operation. Keeping PLL_EN asserted causes the PHY to draw
> additional current during USB bus suspend. Clearing this bit results in
> lower suspend power consumption without affecting normal operation.
> 
> Update the driver to leave PLL_EN cleared as recommended by the hardware
> documentation.
> 
> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

