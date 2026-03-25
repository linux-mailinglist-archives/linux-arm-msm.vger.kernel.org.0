Return-Path: <linux-arm-msm+bounces-99808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OIOGUydw2l4sAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:31:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C583216F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8B563005164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660D72882B4;
	Wed, 25 Mar 2026 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRUv942K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDWonWwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366519D092
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427323; cv=none; b=u9+vpMeTJe5ChA0+BoQGmZqAIHxCFtuiKTn0CtEG4vo7cz7pW3v7fSzjZpEexytlvPdvJdP+oB70/KNhTovo0LLaCmgq7UBzyiaQzUN9hy6CGfHne4sA8Mn0y6ekbj8Tt6JD/VY7cEddT41cmVDg+PYhqr+RjJ8CVCNNhudsoLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427323; c=relaxed/simple;
	bh=LfZQUD/ALt1nH7+l/FbqkpmRqCmCdM1M2MXCBEQ3m9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idWRTDKyoSXsqtKhqtbEK7fuFu4DZA4GAfNGExW4pIkfYpXACYPjVliOcGaazB8k2WWpJj+Z87qr0OYCioFxhaxxRWRZq8bwgpKXXQC+5nFd/dYOOC58ZEiVAZLR/9thfOGTDCz97XkI0leCtvSdxu7lM1V0Jy9cVZfFENjWAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRUv942K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDWonWwO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4d2DP989131
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=; b=dRUv942KRH+OMTZc
	X4s2pNsswgPEP4+NkHk8s5kW7ZFCxmVOyJm8EJMpkAI5jMtB3kckr6/453/mYRq8
	M/08iqi787QcUtxrL6dqiktft4nQGha15LDL4AkYgwEJCjlm0JQpkMQqvCSehjXV
	rTNBnCqCO6kzByyTTQX60+VuK1oFy/xp+w/5gFu1ODeR9iSwFVDaV7Iths2dKxHD
	xceKmI6YN/Yyv+wEcG4EukP5U7h44HdtDjKRmtFRrm/meZp9YL1zEpDNV67y0sjX
	drm6ECao1DS+4rfNr5W2dlOkp6s1r3juPqUkfSqtQBGE7yLjfgOyuV7EMHwgUzrO
	aK4BEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m3u9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:28:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so56900885ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774427321; x=1775032121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=;
        b=WDWonWwOp+kld1drWcqmROS+gVJ0fcs2bTSt8oZdMNUE2C/PUwVPWfMpKfExD63drt
         TY91NdGztV5cAGeRRZn57ZXi+GoWKajb0dhiWx+Tnv4+7PM5KHhqT7EbsdnRaKxCqjj1
         W5czhJ9hM3aq8a/7xw0+TcKgkL0ozcit44Gw123Iiauc8WBzFfgRKG2blbOXabY43APE
         PGRHLYNYAvGqcKZQa+URgMgj/E1hIR/Uos1JS0jhvNUpK9CC/D0Cy6fODXE/pVb7i4kc
         ZLumEOoL1/BrE/mK03PpbC7Lg5E4+S8gKPCmPgNCJgItzT49C7xZ6OBwogq/uwsXpIpM
         E3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774427321; x=1775032121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtZB1CBJJGynEOWTJJj+SsulF8ZvgdAlh1AbJNLegLI=;
        b=tYTLl3SKVLHwsxW1Q1WrhoinU+JxTWe0Hmu4iqqjQtUfjYvJWAb8aHgEcSum7Gwcjp
         CLAjjXTVBYCin9oLRoB0dUbo3/1iIdrFpXqYzTL8aaDvfDrGTAqNKAyzMetNESB8K1EC
         R78a9HHyVIwMaVDSBvhneR5Iq5guGY7XUhDWlBueYKrdfIhk+TO9sQkBOqKg5ODZSR64
         c314aNdOenfOoP1hMNWKc6q8l3gaZncRf7/SYIhk11sCTD7s+nlQJuTwh2qwriT60n/4
         9oJ/p4pPf3mKOUpZYigrYCaDIrE4bcYloLMhEXPlfeEtblujS8hFMUbS3KiUDtGHk0v5
         8H7A==
X-Forwarded-Encrypted: i=1; AJvYcCVwjPwMqM2ZKkbH5mveMOsV3iDR57Dp7s5zrXFqPMXW/+Muz0jKPrbWFwtGepk6JLvoyhP9ff9Byp6uLG7h@vger.kernel.org
X-Gm-Message-State: AOJu0YyItK5KmoZgL1v8lxGR/L7hGUIPzH78be2ZUsvq9wLko+P5hZT3
	RmJdDVpAsvfqpXV785YZd+jJAVv1AD1CMukjGGdqhVpiXuCF0/ChNpTM3INERR387THJJEyZY3D
	NJBewZyxGcGVd7bWqyQsebp2DAotXb77txYmZHbZdw/45AbEsp4WI6y4csChSEmvK+/Zq
X-Gm-Gg: ATEYQzyuPe3Ld6ax85fH3zoDKinSMlR0JiC5x5WOT5hI6ceBx4jnfGkA13uQmtFvAHY
	mZGrdlR1Oee/DuYYVG02iCj+9D/K6VKyNvDVAHFpVtPs7S6Dz0G47skddkHoGH3DMIVXyPI0Yf/
	9eLHRj0LOAjjH1epRPk+Klpxuvjb3ElrjfO/6i10CKQzbVCpNqOgB7oAO1EjnNbYHjn/DiyuG2e
	lQQxvDxMYiSgWhQK3A9orRLUk+C6VoLar9jLiauPt+SHHZMnOGgiNEfR1dvN42Y3PZmOzOIcmCC
	gSsfIKQFeyzKW3EX+6Eh++6hiv0uoL0VC4ZpM6MruL+pHQi8AD1wYcm4JdLVzP3AxYbzVFKKvma
	Qn/0wW/OQwXm5SLIDyi8aa8H1eMCLdSZiRNKuk0yoLbq2Mzr/8IkohXCW0dJh7od/MVqitdUORK
	K8hu83TkfQRc1QyngdbBKAH8vaAkusPXb58S1fLbGFrilXscc=
X-Received: by 2002:a17:902:d488:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b0b0a7f83cmr29581585ad.32.1774427320826;
        Wed, 25 Mar 2026 01:28:40 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b0b0a7f83cmr29581405ad.32.1774427320384;
        Wed, 25 Mar 2026 01:28:40 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836ace98sm174408505ad.80.2026.03.25.01.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:28:39 -0700 (PDT)
Message-ID: <9dac8baf-9248-45d4-9342-8f1c0e40e327@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:58:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c39cb9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lAVPLi15b1ITBO9RJbUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YTq2V7vmFXgn_aUd9w-Sqrs0mBjqH5ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1OSBTYWx0ZWRfX66sAmk8TqoHC
 xBZS80fF6Go8ygFBkdQzucE7DIOhTjpyBHoTq41iDIRj0Ol1gRXke2587Ed7ToHSQ4pDwcPKcjR
 snSB+sNmYpFuK/qIbTErbZXuR97DwfMFFPK9C4x44VYJfmBSW/ygUOUIdXwmcPlsI+sFevTceyK
 LFn2cOoHfhZVovGsu05U4I4OnSzMRppW7CYT0DBUoLy2KZPAfAjQJbAdKVzMQ0/uA8rzTHhB+r8
 6KevnSqxCByDMZAVXytpzyZnZ6D8khnXbvbv0ypfTkln8zmq842pdTKLDgOoF0C0YlHF/v/oQjQ
 8BCTkbr+cNeQ59f7i76WOqMiYUd619wycj0o2fh6YE+eTJX0o3iPuaB5Vg+nF37hP03rUPp9J4e
 WoWEZ1lrNCW/9i5IoiRf3PmnZgZp2DaS/OOvxVu9W1RsVihbcYsV4pGEvhwkOpe/aTJua+OBJPE
 MCDsB26EL1gUHjGCejA==
X-Proofpoint-GUID: YTq2V7vmFXgn_aUd9w-Sqrs0mBjqH5ME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99808-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61C583216F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 8:42 PM, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

