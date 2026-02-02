Return-Path: <linux-arm-msm+bounces-91441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oODIBlZcgGlj7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:12:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C3C98CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7EAB3004C99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 08:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DE9310652;
	Mon,  2 Feb 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekB0z7x0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGEgOJAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B027EFEE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019680; cv=none; b=qYgCFHvoBSwA0uyrLotTcsyo7QPVFiecpPw53NOqL6iGFmxoFldZE/g8on/oCuCkt94qPSHaEILYDDirG9uL5fTXdnDeoyXOWtXWgnEPAVC7AUDAWyjyJ46upoQH3rtO6eoC3WzSn9IEXuIdrq0hWpzxAhXGb1UG2aXFROwkpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019680; c=relaxed/simple;
	bh=e5UiulWzCpaboMvckiModZJV708yrENsmfOIZvdK54s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFUZY2AtXdUI2nHCImcP41yL1x46k3NlciTgBU3XHdDJsIkvg5wV8rt7LNZB92L8VPf8aFWJwnuW0VZaZGmKTRwdfVjjIlzds4fmEOgG73tIqxPBJpVVCAPm2cw97IgVxsrsaVobOmpKfNEe1t7ZCfZCjEcOri80KsxfzBJf/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekB0z7x0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGEgOJAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127xTr62751940
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 08:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=; b=ekB0z7x0h4AZNP7G
	A+JnxbuZZxqMncceUe+4sl1yG/kRQZRUvlHm2Tz3ovW0pvXedn6pVXfDzhJEI+te
	QM6vWk55TZvHtXgkRIJ/nQO4zjIX/31NKN/lmsMTywNojcz2ZomG1BF+iRrnGnZz
	0zoC+dRjSU8jlVEvBgScsmA+VX6ok3wjAiMdq4HgB27Q/rOvEeQ0z+nzBorQRtNi
	3cCEuJd/1CjXEAmqOnKlnwT2hyEwVKqF9Kz/acUnaPjAYYGB8M8gpdLwOI3PyWsW
	daF3cl+KBOpNGDMj4Md3hNGtBTjgMxgDBWIoF4wpXdGg2B64bIftGMd0bhVXi5XK
	d0YC8w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdckfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 08:07:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c68b97c0adeso838977a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770019678; x=1770624478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=;
        b=LGEgOJAxstQxFDfJ9i+YRTJ8yNT8R5+u+d+g2+irBnZF6ds+/Vsk1rKsKvNdqvkabF
         fQ5/GNx23vjurAE/KMY00Q2wztoLwfCS6sSfFO6aVBW6ic2xJq0MjetJGdtPyf/d09o/
         pkevt4GtNfoisaC43ZqNj6PidV9REkHPi04SLN62ewa7CCqbyJe7UGHt/LttBS7AJik2
         4pYKK0it3dY7WC6PEivL0Za0XWJX/2zkxSK5e+KrL1EUGj98zr+ZyDHJi7X+5KFTgbmy
         /k2mKfWmGXlLF/E3pMFe8KBSJPdIGMVCvBrahUYh1JzvnkOmAkv3MCyw/nd+DtuglznR
         9zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019678; x=1770624478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q11L4BQa7xe0Hjz/HSun8Va0jvfPXvUtsh17UGLK2c=;
        b=suJEDsV1ZOxoGMq0vLgXzRiukh4izbD7H0lHnwm/CO8JHxxQwzAbJ4vNnAD6XOs8PJ
         xtONOqjA2eL0/mfI59kpUUqzAwuXaweY3m9Vc+hQm2ggrnSL1YRgjYbYfg5jdB5VEOAK
         nvIKhg363BYlgjRFh/UUyQ0zJKIXdWDL1JNMHaoxPK9ukUPiFRacdPOmihojco2LiKbe
         /aoM1L9rYoZHtzDcGpcl1MPIVQqFrXzrl6eH1G+v/lV2vN1uGYuqPhBJmQ/Nkf4fUmLm
         FUh1l5dhcVC9ImnEjiNPZJQjsq9qlJC8stvkeQ3qtvKGf173iUL6BRlF48aSED8gb60n
         6ppg==
X-Forwarded-Encrypted: i=1; AJvYcCXYDP531uokO4d+3hpmABjrTqgZlo5hK4rHevNJqTR9ci5Ot22FMb1w+tXtIpDOYId1s7qz7lv4ZrouUedZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAM4zj/Hb6wTNbGIvBvJFoyc058r/s8WePgQyYBBOxGgW200ys
	18CHkE6VDMJidPXClfPDdXCzqGSH//+3f+dghG1G5pKkccUJ7lQPj8MnvqOcYIVrIfGnbNWtegY
	YUiRH4nxTgMEKNIKNOkkh8v7Y3sSPe4BjYe08HCU7kYL5/I8tNX47C0hQ/q5Q4YiScmMb
X-Gm-Gg: AZuq6aIXuQhT+Ni8HFcaxfFbEZFQ5oQip4YSi/zKJnR5vgPupXW7bCjV/9zgepScW+S
	YGBhLJovrir8sVSiPjpVXi0KItJ0Y0or1GV+LNaa9joQS11Pug2dHPYrqHdLglblINhnPyUCKUN
	qUTmyR5kPry6xiHDNCrPGXIqnu/VxnbbeEvO4uegnhpd8nlPD18kiB4MgzMLXhYkx8waVZx4ZA5
	RM6gMkhvaC+3Jyn6Tc2e+o5SOvDEZGyPKc49eVKm/MsCdLji6hT/MJD8Rh2z9Nu5MGBaCRrypg9
	cUZ2bJdl8XA1RWObz1kanty5WfEkTIDoe8FtGmp0XGMiQgzWVkvDFpdIF62XVli8jGNd2pJePRe
	PcSza2zVh0Hp4dEWjT6ZkJ36HcJUS1IpDmQ0rHkisM5S9
X-Received: by 2002:a05:6a00:9288:b0:823:ef8:5ce0 with SMTP id d2e1a72fcca58-823ab65bb2amr11704829b3a.13.1770019677797;
        Mon, 02 Feb 2026 00:07:57 -0800 (PST)
X-Received: by 2002:a05:6a00:9288:b0:823:ef8:5ce0 with SMTP id d2e1a72fcca58-823ab65bb2amr11704800b3a.13.1770019677275;
        Mon, 02 Feb 2026 00:07:57 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c53f6bsm18084171b3a.63.2026.02.02.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 00:07:56 -0800 (PST)
Message-ID: <9831d703-8427-31af-48c7-3942108b3a55@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:37:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
 <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4IWW9XrWhH6c5gicA1HOK_vLrgMsp0kB
X-Proofpoint-ORIG-GUID: 4IWW9XrWhH6c5gicA1HOK_vLrgMsp0kB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2OSBTYWx0ZWRfX3WWcpNM+LeQL
 ynzDiSBu5LBm6RSZaxSDt8tDxOYDxUOGusMhY0EeSXYQe/01ubouR8cNw8Mry4dV4pSd3k8oixQ
 H39oqxXGdCEZVJBKPn6iTNd2RFHVYZWeEuFdZGzHxiEwgZUSBYTf+WQHSpqvC+FnAScPzK4hXPO
 oVknBACQ661oVFMcFw6nMi4cOLeZZUQXT0ojBIu+5erkmnlsOmf2lmUIpuVPd8xHiK5H7bDO7qc
 jT3kdSSKtpNCOqVO6oBzPeWmLIKkFFn+JFpQbpM5kQZL7DFwWXHCCZK+Wsi8TIiOCqZw/+TTBB5
 fqaiNn52ByLSUNgKE6VqtH9Qnj/76eFpv2DSI5oDJABHkox6BJaF9QI14kvIyAYXYUDZAhEo9MQ
 pxgrhOnCmK7SCKk24jYyLu3O3gK79IkTyR1otS8gUvLBWbjGFMEKbqEl83N1RlhDhJeTvhwFs/i
 CweVxLTmq1IZYkis0Zg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69805b5e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=9QtVEiAcijqVnSbVjO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91441-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B8C3C98CB
X-Rspamd-Action: no action



On 1/31/2026 1:03 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 05:59:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
>>> SC8280XP having just 2.
>>>
>>> Document Iris2 cores found on these SoCs.
>>>
>>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> [ bod: dropped dts video-encoder/video-decoder ]
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> [db: dropped status, dropped extra LLCC interconnect]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
>>>  1 file changed, 113 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>> new file mode 100644
>>> index 000000000000..d78bdc08d830
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>> @@ -0,0 +1,113 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SM8350 Venus video encode and decode accelerators
>>
>> s/Venus/iris
>>
>>> +
>>> +maintainers:
>>> +  - Konrad Dybcio <konradybcio@kernel.org>
>>> +
>>> +description: |
>>> +  The Venus Iris2 IP is a video encode and decode accelerator present
>>> +  on Qualcomm platforms
>>> +
>>> +allOf:
>>> +  - $ref: qcom,venus-common.yaml#
>>
>> Pls remove the reference to venus-common.yaml and follow schema of
>> sm8550-iris.yaml
> 
> Why? For example, sm8750-iris uses venus-common.yaml.

Ack — in that case sm8750‑iris should be aligned as well.
Since Krzysztof’s patch [1] removes all venus-common references from
sm8550‑iris, all *-iris platforms should follow the same convention IMO.

[1]:
https://lore.kernel.org/linux-media/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

Thanks,
Dikshita
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sc8280xp-venus
>>> +      - qcom,sm8350-venus
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +      - const: core
>>> +      - const: vcodec0_core
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: core
>>
>> It should be named as bus not core
> 
> Ack
> 
>>
>>> +
>>> +  power-domains:
>>> +    maxItems: 3
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: venus
>>> +      - const: vcodec0
>>> +      - const: mx
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: cpu-cfg
>>> +      - const: video-mem
>>> +
>>> +  operating-points-v2: true
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - power-domain-names
>>> +  - iommus
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>>> +    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
>>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>>> +    #include <dt-bindings/interconnect/qcom,sm8350.h>
>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>> +
>>> +    venus: video-codec@aa00000 {
>>> +        compatible = "qcom,sm8350-venus";
>>> +        reg = <0x0aa00000 0x100000>;
>>> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
>>> +                 <&videocc VIDEO_CC_MVS0_CLK>;
>>> +        clock-names = "iface",
>>> +                      "core",
>>> +                      "vcodec0_core";
>>> +
>>> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>> +        reset-names = "core";
>>
>> s/core/bus following the existing YAML
>>
>> Thanks,
>> Dikshita
>>
>>> +
>>> +        power-domains = <&videocc MVS0C_GDSC>,
>>> +                        <&videocc MVS0_GDSC>,
>>> +                        <&rpmhpd SM8350_MX>;
>>> +        power-domain-names = "venus",
>>> +                             "vcodec0",
>>> +                             "mx";
>>> +
>>> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>> +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>>> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +        interconnect-names = "cpu-cfg",
>>> +                             "video-mem";
>>> +
>>> +        operating-points-v2 = <&venus_opp_table>;
>>> +        iommus = <&apps_smmu 0x2100 0x400>;
>>> +        memory-region = <&pil_video_mem>;
>>> +    };
>>>
> 

