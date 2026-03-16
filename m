Return-Path: <linux-arm-msm+bounces-97895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFdnEObYt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F2297CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA6E53024169
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F17938E5C5;
	Mon, 16 Mar 2026 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOizatBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAOQGrM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01C382F38
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656231; cv=none; b=UhdkCxkbfZhQkhbd1M2stnyOsX+nmtMALAF3FJInVKGdg2ZB3TcVoB8ycAvrNNVHNcfOwvSM2103PzjqKl3A8BuX972hXFXpL+Riq+F/0k0lTx4axYI8ZpAgl9PmGaIpTPhUiTF39Zl3FoVtof0qkJTB8WAe2RoTW09l5gGLYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656231; c=relaxed/simple;
	bh=3BUb68G6E1p0i1OHD5nrfVEdL6XAIAP3G7qZNqzuW+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWKe1rZrrtal7UCA4IjZ00IEU5KN8Kj1g596Dq4yIGWPguh/5pYR8VaQNTtBYT37TVqzay5e5SabRq+htzciOQOijxiE20vdAinstS3MF86C8w0x3ny6q2A16CV1gVUg5Iuxr2unH8d9gPlkh7qt4RYCq5Ov33RpzXP4Y9QmPMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOizatBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAOQGrM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7moNo041516
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCZs4K7xmeu92jnzkVpTVH/0CisqEUASlHg/j6UvPYE=; b=ZOizatBhu/fa449q
	zVMmsM/lPBGTGCKyFfy62hLvTKD2JezbjLSqsS4Kvw3LOf5XMV5TGFgUoX4vF3zy
	UH7exMUq+GsV1ny48lE1t2T/fy5PECkTVEGVyt/KRhNKujGiyJ4ABibslWb9FiZ6
	LauKAlHpcdn4Li1oznPmype8cS58E8WsT4GXvGkTp8AUXMzpUHX+ZW4xvlEAhdxL
	7Sh9JCOGSD7ESwsA5DI6lNhUBXew/rrzAmOn5MV3b7rG6NSKznB12gW4Bm8YpoSl
	/B4AYjXUp6az2zzWLqgANELZShFmzcQBx0rkwSXrhkusUylR3iD8S5NheGrVtYJa
	lk6jvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80hgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:17:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7604c6a8so314861485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656228; x=1774261028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCZs4K7xmeu92jnzkVpTVH/0CisqEUASlHg/j6UvPYE=;
        b=HAOQGrM2lwdORyN959/QGKqVV9qK5FA2Rlb0NlslGvaafZVedzEyeqAlmyxakntS+g
         1tnJ25Gmh+fKGAVmFwd94bIIYapBEuqUKqCmkDl+qOS/rXOHwES5brfRt6zRXWV9x9fi
         c2sv63NvvRvsuwEpKS5TB/dax5OmtMQDubHwK20cYvJ/VQ5aNg/oFtQIOR90BAuBm4i1
         w0DCrGQKyipCDqcIJRJO6MH1csgQZMMjRgryEfvdrjzkzNSg8/GAotDdPQqIxTypCLdM
         1Wbbbe1G8HZXV+4oWSSIeTFe9G4Qj8i+JS/DW0zO2RFcCGBIDWX9HWEBbYNw+7g4QJkZ
         wH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656228; x=1774261028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCZs4K7xmeu92jnzkVpTVH/0CisqEUASlHg/j6UvPYE=;
        b=QCj+G5E+p9sFfjlylc/5lW6F07wdfHt2h8gVroJrnc/cKfuj5KlF1sFOj9ypKbhaF5
         /KcIINHT4TJ8ouN7Xm37OBWWMXQSo+4UbUZxQB3Iun4a1u03G12VNE83Emh4FUUB7+Ga
         7D0Em1C7rKO3Docl2vhwpu9c5uRrhrgz+zhrgPDb7F3+bJG9Cr8OR+Jl0T7ycMvGXpzK
         ncW6Hzu4G/9ZX2+HEW/jpC1+n1iDGgb6sFNArBBSVqBEqaAC6XGry6u4/sDbAecUlw0q
         jEjKbZvm+cpsq0o7PC1kJGJocF34BSRsGDVkpI/1Nl/6sYkt+fMACL/6e5EJu4x+iENV
         k+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjRjMGQClk7bQlbJkasIHbdLlntPChsINVLl7Z82ChqFAOc8asD4Ez28lTZLtnUJoHNpGnNhQPs7ydl/Ac@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/V+45GYnSDTJ8AUDIdb77igQP3PQ5NW/JPCSdGZHmAC1O0FN
	I6w0EpE9ALvjdRYI2ZOHtlb/oH8BuCsQN2N79Tw+qRz73eeqG/LCnWuOlfXHUKN1/UtAWk3Dn5Z
	fn65PvZTaaIDk93TksoBzu0SPw7MegVyUnCfYNuKyT+jDAvGll0Z4T9YcCtALLU37xZTY
X-Gm-Gg: ATEYQzw9V7RCWamj+UYVwzrvR4GkfQ4Bkyh8KZ+fhAA6uB8st5pJklv2fcWeIRueBKZ
	P9iO+PPo+OC+CjacYQ7mDrjuYJ5799j3RekfzV2lVDA30KDWKyoSTwp6LGExrPOcn1skOXuGt4o
	DpDOulMXj6hERVrL2wkg3ekTLaNIL6c0qE0c5HjP/9+lid6i28E0Lp0FiT6rnGqNIL8XjR0fjnv
	SwLN4vt92dlU9Y6FccbqpYI8F6F8WnQDAALIGqn3v464RXDfMH/mtPuv6rtFmuDp/tf37mB0SFD
	hpb89p/6StGVV07BrvlbEjOkoK/orXF0QECvGFEbFyLL/LRgiOYVjse3nWubImJQm3YD2J3FPaD
	wpvLDXPkO8Ma/mS7HDWjaR0JSMp5B/ksfJk143WhK1FDKVBAIMWS9FNJjYDZ8a444lLfKzV3tNa
	tPDLQ=
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr1206036685a.2.1773656228420;
        Mon, 16 Mar 2026 03:17:08 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8cd:933f:d8f6 with SMTP id af79cd13be357-8cdb5a55831mr1206033885a.2.1773656227970;
        Mon, 16 Mar 2026 03:17:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb9bedsm4831284a12.3.2026.03.16.03.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:17:06 -0700 (PDT)
Message-ID: <0727b1ea-faef-4b7d-a60c-098a17c62b5c@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: document Eliza SCM
 Firmware Interface
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com>
 <20260223-flawless-shrew-of-skill-efe049@quoll>
 <dqgcqu2wcskl7rxpv4gf2ltunopyjd2cpougkljga6ogih5x42@hji7dtp36cvu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dqgcqu2wcskl7rxpv4gf2ltunopyjd2cpougkljga6ogih5x42@hji7dtp36cvu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ngfhgryzk5XhgFESuqIMJA9BTRQSbPHZ
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7d8a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=m37IwZ4EKonH331Hz6YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ngfhgryzk5XhgFESuqIMJA9BTRQSbPHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NyBTYWx0ZWRfX2X+YnnOsJS7c
 FvGxhyyv0T/L4pXIseyC1CESn6+3pemlNK/JRej61Ved4yI2cvpwn7Zu8XpLoSOTceWRNURrD6l
 wEoVOt+NxZWLHsaPn+Ch4EtGSY5vftA8fpesfgkSeVZh7V9qhEa6p8I0KVzaKq6g3D9EkZxXq9O
 a6bXZcpwW95rQ7UHpZewQJiQI/zdXMl9sYvhlk/DENMQTvgCp13uGsIrk+AsnBpcFSCoLumt0jP
 rsgRGPReNUEv3t2GKbTMoLGIjn6Rjx7vy4OuMX4s3KYutDrmwgU3HEg4LqUV4MEfYAXwXSSbCOs
 W8+U3KS1tRszl/r1VYJjZBfFF94vWYR9zyiv5xB9WhYN/SMRRDqsshy3+ThuTmtNxxV1VlftNOM
 0+mJigbUCHo/EoFomN0XjtOehaNOlnVn/rtNvb47vuLQfE7YWk/VBNStqPZMCxOyly2mO3o3x83
 vcvwYVYE8ilJbgH9Bxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97895-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 970F2297CBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 11:23 AM, Abel Vesa wrote:
> On 26-02-23 11:41:31, Krzysztof Kozlowski wrote:
>> On Mon, Feb 23, 2026 at 10:42:02AM +0200, Abel Vesa wrote:
>>> Document the SCM Firmware Interface on the Eliza SoC.
>>
>> So different than sm8750? Then you need to explain, because patch looks
>> odd (incomplete). Plus I am pretty sure it fails tests on your DTS. The
>> point of the bindings in DT schema is to actually use them...
> 
> So as discussed off-list, schema doesn't fail with this patch because
> interrupts property isn't marked as required. Not sure if it should or
> not.

No, that's for a "value-add" feature when multiple OSes run at the
same time

See 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")

Konrad

