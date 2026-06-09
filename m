Return-Path: <linux-arm-msm+bounces-112089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tucUBmfgJ2pP3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:44:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1091965E751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:44:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J8l8TYYK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kPHR47aW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112089-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112089-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2C5230F7341
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E873F39C4;
	Tue,  9 Jun 2026 09:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A10D3F23B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:23:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997029; cv=none; b=rVYX2Q3gyWpyKIMbWftUua4XYVruq6c1C3Gu3piWL8aLWZutr5o/v1Dmnico4E/GcZ9LkUJFRXR0ZrFUJ2NxBBwCxxaGaOPnyjKgL3mp0jjDnwv8e3MX1SLY5TT+E8v6RR66/SS2NW7OnIFbRyPrTa/yCRPDtomjkyiqnviPzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997029; c=relaxed/simple;
	bh=ZpIODeaWyvNsPh+tyzLmM8QxMULdEDnuoxTNS42vm4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnZSKpKTJ4Q+UPDnXknr0ZgQwjpGcUOxtE/IQ/fSeVb4KrdXBVMhC9QgpJwffVa+0hhr0kLzfPAqIOQHsc7pdLD5BPwrZiaebxWGZv5/eGLf8+O58Pn+Z2Xy6M1mvOobuhyMICcasnmZ9dbRobIx3v45TdGAXXTd2o5i59eZs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8l8TYYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPHR47aW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rJCR1585639
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=; b=J8l8TYYKtxQALvIA
	BwkDOA4vcH46Cczg66R/mr9syI3OGuTAel3bg4ZaSoPLnLMLkB2LZBHmNcga/ES2
	ksy0q+9GfHVUtRQFwqQFpUetg60d2YKz/n4qwJzMaD5a519lQpCt59sfkPdYGXBE
	7CNJ57SDItYpC4Btj5Vor52YJtvVTTY2obYzSjgTOs2hNc4CmY7H/RKrPy/d7ur+
	3bNPc815RMdUC66lw3hB4nNVSUb7eD5UgtHLTdTP59zR1myoegVnMvktD5kThDgb
	mezfY8HZUK+PDw5lMKob7X4W9qGQdq+mx9FUwKdt5d2Xv1GjBm/Lk9oVTg/DERx5
	PjBwKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggdqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51757324dcdso10899411cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997026; x=1781601826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=;
        b=kPHR47aWIfR7FL9pYnlCUIhvoFNfruROqJwvSbLII7gNLvMU8dVFZCfEf9sLvutZV1
         IJW7ngsafchjWLv49cApVB6VnsPYG1kJsEaC+sQAtkZnA/PvKO0IBWK+KdhegA0LdKpo
         itWMgVMY85eoj/RE5GmjEfivSTQd2RXviu4vPQlaLozPC66Ymc1O8yXyzR6adRXB/ad2
         EvA11T1SaNVXMIcZeGvh0UwzNYX6Dopr01QqQMZnfdEIikbMwkL0uG0GlK2mnvcB39/c
         kr4jewz9br1mP+IykPs2c+vPzIra4O7zkX8md+rkDwX1a7YPd4DvR66aCKl9u0lMxMt3
         yyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997026; x=1781601826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbvit+7ci1GtusBQ8KSQzozSOrDSwLmGC8Gr2o3/pSo=;
        b=ZjJbZvL7E8uf59WcOcLF7Gti7gHhadsfErpAOxUb9v4ps1M7nhueTd77GHOJIcvL/t
         vI5hlF/LUfwBRTPQEZaePpzb9A30Pdw5aq6IByweDguCjFf5AWjFZZ90LdkI+YrnjYZ1
         wqVtloJklqCTBSXQ2/QH4ln6baDPjTF2AcVK6X+BO321ORt22HwZ1zY3KIIUAVErBQUP
         FCmCi0SYVB1x4YOAhNGETJ4EzLVcTGcwvtz67d93H+iMl7RDD/UsIeUEHqJN6aIZuRt+
         rkpNmnAO+rqy1MsM2NVLtgopEEKxUggAAuLLvhf1cz/iAAB3ihj0ktGAQc2kira/JrVm
         7bBw==
X-Gm-Message-State: AOJu0Yy8Yw1Et/M/y0qj71g2zN28oRTMgIWwq74QDJoYKpMtEPh7daCm
	7Zd+m8Ay0B1+FVr839XzcNvdmp7t5QTS54fx708Ff6WujugHmfpSEsGlidxZI/VDrF8OB3zosNN
	0gCV7sdSztMHglnbBBeXVtRj50upfVCFQTIYZ811VMSzvmugKbmrrq281PpWDXc0J4/St
X-Gm-Gg: Acq92OHCnTxC422T1+KjyIeUXj8i5GoAbQsNVP3Nk118UXF/GQL5HqRJsN1/WZi73To
	z92Qh3zHYYzoVHSpUo1GPcc5GK0MmJZe2lJDbn7J6kcet8JgQkY7yFcxx+7905NCKZqBmK9wPHf
	8GsrC90GsLU/rE/eC0pLbNLA37RVeoHpoLV3q1rjfdVK+hTWgCLsJFLo/6dKG+Am4fvGiDAFEOk
	by4BZt/FTaKgye1A4osbI9eWRS3+lZFOm0qFwLk6qP/zXcCMeQocBwOBqVXV9jXlQ/fDHrAlTc1
	EfWXIaOf2nCa1ikFQpFAIVdu1COf0LTHYDSMGoqSJ+X5UvMRI9D/S1E2PtkdTXlrKg7Rp8GLDWi
	L1v4VmCVUL6Dpi4Fb8X49iNIfjd2n/fc1L8tA01KHWb7yGbm24Crefr3o
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146708021cf.6.1780997026372;
        Tue, 09 Jun 2026 02:23:46 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146707711cf.6.1780997025796;
        Tue, 09 Jun 2026 02:23:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm1029181866b.16.2026.06.09.02.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:23:45 -0700 (PDT)
Message-ID: <947bd383-a4d7-413b-831e-b7077ce22ebe@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the
 eDP display
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
 <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NyBTYWx0ZWRfX5iMdgGOwHJKZ
 7K/s8DJWZGgw0NaPd5WERtpOWMx8O2EgGbu6KrHyaCusPTZ3Ff+IW4gYkFAAn6cjJ6s/1NNzGfd
 eE0dqKF81DnLXevO+TTinuFktJAv0Ptm9pyANAue4K7Gc+gNQuxn047gyv1QyIRcmyYLDi+2hH7
 kp164mlCAdm9xwW/r931x4QzW0h7063GqDz5X0z7OSXOkohm9irwrkMn5BJUqwalB7WoC71/OtR
 mwBFFSvA8gVAMDWZRfSZj8ImHoF59TUe0rfrpeC8Ee6gVNKX3Mjz+b+iUKiP7rV6H+YMDV/e1gk
 4fMKjwT35erJf8aKaBE4yEYFYq7B6sl5586jy7Ev0JjjwdozSW2+U6KK5HvVLMXs1Z+8pVZw3SK
 lB5Svfl/VRP/MLGt397RoXRstrDZ/TFEhDFSRPzhRE24pE2zpOJ6kjbE4AGf36aXM+dVeVKXgwX
 Q3yQtlh+9U23QsXBpkA==
X-Proofpoint-ORIG-GUID: B6NyKleEOQRDesm8nrgL99MYU3Wn6cBH
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27dba3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0lrYLeEPhB1H7zg4qqwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: B6NyKleEOQRDesm8nrgL99MYU3Wn6cBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.55 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.61)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jerome.debretagne@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:jeromedebretagne@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1091965E751

On 6/4/26 6:18 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
> Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

