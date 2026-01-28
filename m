Return-Path: <linux-arm-msm+bounces-91015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BtLKD0Demku1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:38:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8AA1584
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3881A300A756
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ED034EF17;
	Wed, 28 Jan 2026 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPcPGnL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7LNTKBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABD34D91E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603748; cv=none; b=P8d5FEnUMZOssJrZvmp1rJ7BV1CuT+e/qchuZx4yl2iHaJ+d/NtvGgw9xsODW9uqlwCLx99mjQT/ry3ogJSha61uLzFNS4DLTRjelquEn4RqfYh/3PoRA8M9cJPE/Et8IVfB3TkdeSgblzAJWYaNpEu8KiWXxSQuf8LLgzpWJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603748; c=relaxed/simple;
	bh=piMQqax2g6RH13aM3sWkhhni8P6cTBws4qC8y6kGTQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMbFNjErl6yV8RQMw1QOOYJlvkUqUUCVarJIHbP9gIzRBST5PF79NvllX5tdL9b5BqL6PwaXRcw9mJQbhf22nhVU2SaFQkBJS4jUg31yM5mCYxmIxdu76lzP+l7692vseaThlfeGUMiXlb9/TtBtPpOpRGiZuDlv/bffzXO9RPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPcPGnL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7LNTKBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91sK33879174
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=; b=WPcPGnL72dGefYnK
	xzwGgz4gRymNZEVklraFKbgzTa4vfSf04XoVv61DA+VEgHK82dNs36y1xG2TbSdP
	3xz7JeSwgjT3Mo1yGistlpWJacv2HjHTZnQTmGjkfQq7dcRl+gQkrC6Io63eeEXR
	jUrsh+ztup+4pQTOK/Zd+4MfcAlllpP+lV4qDpddK7rHRTTLo6T/zwJnAOGzlIyM
	9PFMKoN0W0tLxx0dZ2TV6CSSJC8Uo2+72XrQMrCWs3Y0T9k4SQRBUvL5OhCxG+89
	3QlDdB+JXrVi8o8uHsr4EHKHKCB7j78f/q/vuXMXA5hz8IWs+2wXw4zPvQ9X1U3p
	ARu+JQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1ewd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:35:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a49b46380so19668046d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603745; x=1770208545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=;
        b=H7LNTKBGsklySXN49Gs2GuRFG8VN//8Mdr81sMVkx5S2NC3zGC+BlJ6FIVR2pshr0e
         3weVxKM5JSc6sm52fL2tRsAXTajTyP0l9OCe/3jMo964lZwFaFrfBnJAgcZquMAqTruy
         TdPe5m2Q1W/fLlYTwrYJjLXyoaMNteFh4coB/oRlZmt42ZOxI9O5cz6j9/LO5Pb7ArLj
         qSD9t2IpxSsO3OvCqMaWo+8muHbIOFczRjzXPDI84LGAIqffl7uNYOtwgeK1Xv6gaqBO
         dSLZ1SkiZhulh0PwKnmD+UWP1mgHT24TieEY9SXFQZcH9OJkoNwgyCTwPDR1ZTVmc6rE
         XZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603745; x=1770208545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0vH5dYyD2Ol0hVLBm5JvqzOX6K7Jy0+dLdwvbHamro=;
        b=PyA1bZJ4aVntRjb6JAgwAnvqFbIh3phdTJvwyj7hlNUrFm2Jm1iwpoc2xvwS/WgMbH
         JBBnwC3fZhslxaR0L9fgzvY33ia6u67UKrjTNpeNKbx5QI2sRhvQnGq50x79GytqD1cq
         2Y2/ZAAsKALtegHdF3P33Br2AWGtIoSAp2n2yePbAZ67vbGbJGrD8qNC0gtEqah3qvMb
         t37YgzImZDlDTtr7ictBJfTF8bUdRSrwO9S3mV09hhdaPDucL+snvIsmPZADrr+LmQbj
         ryAA4gXyJQYKDkZ41J09I/yiEwPvhG7VC6tSPi9gRs1YGfZ0N1dnUIQacUDaPxQjscwf
         pjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/ekw2JpVHDsnHXthZQoy29/pJHWj5rJAjYq3PlnCt/ymGJdWCYoeoliU4A/45l82/lWVFT3tQU7832+s@vger.kernel.org
X-Gm-Message-State: AOJu0YyoYZCJbFxsPVMZVQmuLwZgdTR4r2+Ow0L814z5cjnmp6J3Lh5X
	VdnkpnF1AcnQYeOcE2qttyBE56kzh3zKeXibSQvQI0u399RXFEgK4RrSRuOeSOv5f4F5QFudYNC
	xTT+8xL9WZsrd6U7eqU01wq5Pj7S+VSXDp+uZHS8wo3aljK6fXM5Utgdw7ztCnUnsaeFa
X-Gm-Gg: AZuq6aKPvaH2+qVUst8fAxONGYF9wNc7UeeMMQx65NEVJqyR5NXVDIzODh0FZd5eQ2E
	lv3pgN0rZZElFuxCLBW9V4S1Qn8LAfbuuPxBktpqPzvlL0ghRUxItqpVFBV/0bIQtsHJG9w2Y7D
	WnMUp2haPQ+uTGcwl6N7RnDdw5pq8MQCVJpTdTZRul84mAICz47bxz8Dhj4JsODZt52HLpHQi99
	e7GXskQDp6OC4dNZeBBi2gL8r/DOzsRKEpci2lrV9Cgy1JtyBcwIKA7AIAmCKezqfItzTPhrABU
	Or5HhA5M9LM+vx6knqeL0QwQWepJO29vSX80U+Q0MVrMqRZB80Iws79qGTC6PKI8Qd9CAjR1+dp
	DUdGOJ0las798HWpPkYwTa/JcjdRBhNApItsOqEBnLea/xuiCbdQmpn4askqAyVB7aJg=
X-Received: by 2002:a0c:f08b:0:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-894dcbb5a30mr1274036d6.2.1769603745555;
        Wed, 28 Jan 2026 04:35:45 -0800 (PST)
X-Received: by 2002:a0c:f08b:0:b0:894:9f0a:7a69 with SMTP id 6a1803df08f44-894dcbb5a30mr1273756d6.2.1769603745154;
        Wed, 28 Jan 2026 04:35:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm1440017a12.24.2026.01.28.04.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:35:44 -0800 (PST)
Message-ID: <0592c82b-021b-4826-8b2e-d9711d8eea66@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:35:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] pinctrl: qcom: lpass-lpi: Add ability to use SPARE_1
 for slew control
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-2-36583f2a2a2a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-2-36583f2a2a2a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ROElisyzuI6SAquG9sVYqOdNkvHrlfTe
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a02a2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DtRyXgcbd-FaZx3MlgoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMyBTYWx0ZWRfX5VhlYBqhfagk
 mt9Qd4ZEg607OYApv+V25PyoehCNoDHMoqlHftCLEOWjE4loTeBnNzcCEScmL/isWH4v08J7HRA
 uL+70b1f6NGuBV0uRQ2FJ4I9g8hErngYy+yLkLChvW7d76GLb9lTn06uwzZ/3nHggzI78JtP6U2
 BMYIzsZjQ+gE9NmSTg7uyGpZ8MpdhaKo+Z0rEAw4+GRMDzt/QX10uW/U+CqUzSA0NhzwRVJoIZL
 mrIQjLMGlurtFNq7ziUdj4dFZYa+/SEgHTACJ9IyBqOAje9Ptga8aPPLyQWMgopCksTM+Zk5Qlm
 zxfK099Mz5SwtfuEI0mC3+t4bH+HmiEHo2LZlfrDX7wJloZqMtNFyXu2HXd0ZZBL/P2ZPH60dQf
 gbyFwgTO3Kk1TmumiORs3J7NwQlxUDrwRtv8cN2ktphM9Ksoz6VGZtprsgvv6+l455+tbD34Ide
 LanN4X4NWH+OOWTOP5g==
X-Proofpoint-ORIG-GUID: ROElisyzuI6SAquG9sVYqOdNkvHrlfTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91015-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: E8E8AA1584
X-Rspamd-Action: no action

On 1/28/26 1:26 PM, Luca Weiss wrote:
> On some platforms like SM6350 (Bitra), some pins have their slew
> controlled with the SPARE_1 register - probably because they ran out of
> register space for an extra pin. Add support for that.

There's plenty of space.. 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

