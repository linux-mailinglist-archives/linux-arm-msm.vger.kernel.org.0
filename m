Return-Path: <linux-arm-msm+bounces-95357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJqENilQqGmvsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:30:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025D202B5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BDBA3089416
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F622C0307;
	Wed,  4 Mar 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvLhR/A6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCnc0zdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7933D6D8
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636585; cv=none; b=eGUxjw9wHa5gaia4kvZCq33GBs7IQrrgGzqnzXGe+xf81ulCGgQk9uYsotX2WHluwP4+zKtEfNQzpPt2Si1LwHTfCIscKJFC0JtR4B7OjK98rv8+cheH2onxd6woC/0aaWWLUvfiX9zeQA/ZDIC5r0xzYk9Ls1tQFqYv8UQHgOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636585; c=relaxed/simple;
	bh=uVM0hFJD90JywvxgR9SbXm3R6fTJLlHTk99xipDVlBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onIMRFeLWdweZduBVDFH2j8MDtnKONDzJcRGI5g+RFI83HreDufrayI6DU3ubLPAt3R0IKQgzuQA3Kc0bawLdXFTFo0iYcwM9AbSVlb1KPhIVyAwPmqcsWnpfo33en34EhSsgNg9Fid+xoeJ6bbXO5rO+Nuc/NNtyIBPaWWJtcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvLhR/A6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCnc0zdP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624E0cFU029451
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 15:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YznXl/xLkt2ZLJrpg7QUQar3vLrClyj/Q5njw19yf5Q=; b=QvLhR/A6+9khpe6+
	b4vHB6T7iMRvGXskX98wfpn9dAejPUUeJMlSwaIsVZeoAkwVpfWSItrbmaMjGA09
	5ik3jPElTxpL+AYCdmDXbTysrwqCr/T0hyLr9AZn/x54icqD7RCpaLfEdo9kFmi7
	UQQipK2isZvsQdtVa/Djt3hfezDX4742vIThCYVJpC2dH7wviDJgnEOM4ZReIQLa
	PhitXKj97DwdZGXXb9viYdMO7L6TIXmJzbeONOWQmSKl7fxnXsmg1UDVfe43aVoR
	f082F8y5lj24vz4zTLsRnwP4iiVnDVL4sdbpAA00PbLrTBKciNtRDXehjfiX2VIJ
	EAxgew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg6mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:03:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82739095656so2695390b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772636583; x=1773241383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YznXl/xLkt2ZLJrpg7QUQar3vLrClyj/Q5njw19yf5Q=;
        b=JCnc0zdPddIyWpRVWb3UzUX62Eo0XFaJ0Gi7fk+nPH7k+snwdO5yWcBIHSCWbJXpiQ
         3EOSYF7Zjvu2tiu2S2+FtbDqgxy0v0bHv/BzXstk326JQ6NcPPKQHRq9Tp8MB2UxRW5A
         o4pf8+Zc7fwrD6RCcTYEzaU/IGrSf9rphPMAZ8nnEi7EkXI+aqPVl4gxzKk1Icch0MiY
         PDL+DbdZWkb/g72B89OOOfe2v/hnjoA6ZjW8fh5Ps5ULdor4dL0Epo9SnXAUhZzB/t6c
         HH6rvvL1hNQ+glmUONEee1TLHNlqRo6809slWqwm7RCZyGBUP9Io/i/1vAFHidGM2eh1
         DomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636583; x=1773241383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YznXl/xLkt2ZLJrpg7QUQar3vLrClyj/Q5njw19yf5Q=;
        b=MgstR6dXiLP+7sVkMxaheJs5McBg40ikiHFX8Lx4P2NeXZ6Y7uqOQUFPAfFQP+sASG
         rQQ2GwfiHZ7ZQKZ8I0MzLd7zWMhqR4CH1oKUzT5Mo3XdiSV/+I2de555lbN3oY3WkTY4
         VEn6uWDWKNV6rE28zsmQt8IATyyVaqgx+Ejb1XU+qJqOEIydj0BIB3dLsKLZqaparnL4
         x9WIQq/bxa/aytDkvatCzRVCff8pSYmwbO8eaCXHUQycEk85suwSBBpU4sh3jS6ilKYS
         7C9g17ZFPdp7codIlxokaKrLxGrNjStUm7X6z9cnwWL4zXS3DvBd6L6L6Fti2HspRnc9
         Q/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdnzOZ+7L6niX2/EA0O0aMf+c0RJ7PJkw0Y4OzAMFQbjUVEixnj+vA0wXIrduHtO1xynI6iJF44w0KYbr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYS1yMbv02fh/Yj2YvMPD6iJWzcmCxugzABwtFhOGlVb0Fw2W
	lAF1dJKFfWK2zkSXXG6RMlmGWQ5x6vPZRKwS14Z8PtynEc9ecTwuks+FAhXmUIuXgNB9ux9hUGC
	wmXspDe51NvZc19YqZDMmLFj4Cb1TlPK+HJxzrt7hdOdV+PXWojTloJHLnhzNP7RcWgW0
X-Gm-Gg: ATEYQzzFCeDdCt9iBaF0jPGzuPeRH7e0G4Yccpg8O1b0JaxGQjTWhPqvVUj1D/kUp5g
	69GZHbub5xnOA/qT2Re5HF5wdhIDem6l6Wt6Fj86L8g0u5g3+6Ms22CKhxF+mvf2ZtUkEURiQDh
	pkb5WwGaukOXYGDz0p1ys7GxBcsSK2kefo9twO5CxADt37KEwrFMSZOprRoES+sieWVOi4BZ5Eb
	edvqP1IOzMzuCmZcjhpES85lSwFmwhhVVv8spCaZhFeTU21dkY3q8XeUaDwfe77PoruV2Zref9a
	ClNuAtx5fRKtdnEogsTKyfUTNyqwHMFd0hI6sdZ493JDyow9+J6GOqD9CGUL6jgn4Z/YjgSTZxO
	IgEOovXlPIRihU6q8qOoSQf+WtfovglAjdcQHKBOKNvyfUR2cTkF8Ag==
X-Received: by 2002:a05:6a00:2917:b0:81f:4529:83a7 with SMTP id d2e1a72fcca58-82972ba66c4mr2094243b3a.15.1772636582949;
        Wed, 04 Mar 2026 07:03:02 -0800 (PST)
X-Received: by 2002:a05:6a00:2917:b0:81f:4529:83a7 with SMTP id d2e1a72fcca58-82972ba66c4mr2094222b3a.15.1772636582281;
        Wed, 04 Mar 2026 07:03:02 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db1d6dsm17136424b3a.26.2026.03.04.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:03:01 -0800 (PST)
Message-ID: <b0d04ced-8f3c-4bd5-a5b5-0b2f12aae25a@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 20:32:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
 <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
 <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e_q-sLqCoXew0rnPDfi1qMxHOJ9ZOJcK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMSBTYWx0ZWRfX4sB9HMKpvv+f
 62YGe6cZ50woNF6N8iU6SutffOJZ71UHOThAv12KXQWpF9GAzCj2a1rNaIKLZ6jmYdmn0KmZjKx
 +63nyHHzjmACbFNY+nyNPIbj499CdsRamSIQNKANIAnGXgZmvv2HtouWhKnKXqyyQD8ymzgEX6l
 BWwoyuH5g/S5KX8BvF0hFigDQHPciOCUH6boLI/lopQuMQq4nFa05VvQbz1RfQTwQlDlZ7jHpsd
 fBAU6KZ9U+LIuNsRMIvjqztr7l980nruKAhHFyVN3p/7h105nAIBS/WqAjSl7o60GWujM0pLsJD
 H6LsW4b2r/BMT+6RMIMD/35OlABP9LDItWnp072taktv5bpgcSLyvO4ef2E5vMfIjMlIrtv4aC7
 uFSjRAf1Q66+EfSy3zSXEGneUkSdjEi68R3hXJbbStk2XTSY1jhqZQJxZbuJqz6OWcrCZaZadZ4
 IoMqjywq3p9VOOel9HQ==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a849a7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=puI59K64icZz00i_70MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: e_q-sLqCoXew0rnPDfi1qMxHOJ9ZOJcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040121
X-Rspamd-Queue-Id: 5025D202B5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95357-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 5:23 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 03, 2026 at 11:43:40PM +0530, Vikash Garodia wrote:
>>
>>
>> On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>     (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> iommu-map include all the different stream-ids which can be possibly
>>>> generated by vpu4 hardware as below,
>>>> bitstream stream from vcodec
>>>> non-pixel stream from vcodec
>>>> non-pixel stream from tensilica
>>>> pixel stream from vcodec
>>>> secure bitstream stream from vcodec
>>>> secure non-pixel stream from vcodec
>>>> secure non-pixel stream from tensilica
>>>> secure pixel stream from vcodec
>>>> firmware stream from tensilica (might be handled by the TZ / hyp)
>>>>
>>>> This patch is depend on the below dt-schema patch.
>>>> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>>>>    include/dt-bindings/media/qcom,iris.h              |  18 ++
>>>>    2 files changed, 279 insertions(+)
>>>>
>>>> +
>>>> +  iommu-map:
>>>> +    description: |
>>>> +        - bitstream stream from vcodec
>>>> +        - non-pixel stream from vcodec
>>>> +        - non-pixel stream from tensilica
>>>> +        - pixel stream from vcodec
>>>> +        - secure bitstream stream from vcodec
>>>> +        - secure non-pixel stream from vcodec
>>>> +        - secure non-pixel stream from tensilica
>>>> +        - secure pixel stream from vcodec
>>>> +        # firmware might be handled by the TZ / hyp
>>>> +        - firmware stream from tensilica
>>>
>>> Why are you providing description as a list rather than describing each
>>> item separately? Then you wouldn't need maxItems.
>>>
>>
>> rewrote them as below and dropped maxItems. Please review.
>>
>> iommu-map:
>>      $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>      items:
>>        - description: bitstream stream from vcodec
>>          items:
>>            - description: Function ID
>>            - description: Phandle to IOMMU
>>            - description: IOMMU stream ID base
>>            - description: IOMMU stream ID mask
>>            - description: Number of stream IDs
> 
> I'm not a pro in the DT. Is the itemization of the first item reused for
> the rest of the items?

yes. As a trial, if i remove one of the itemization from above schema, 
then checker throws error saying 5x9 arguments in the example is *too 
long* as it tries to fit it as per schema i.e 4x9.

> 
>>        - description: non-pixel stream from vcodec
>>        - description: non-pixel stream from tensilica
>>        - description: pixel stream from vcodec
>>        - description: secure bitstream stream from vcodec
>>        - description: secure non-pixel stream from vcodec
>>        - description: secure non-pixel stream from tensilica
>>        - description: secure pixel stream from vcodec
>>        # firmware might be handled by the TZ / hyp
>>        - description: firmware stream from tensilica
>>      minItems: 8
>>
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>> +    items:
>>>> +      $ref: '#/definitions/iommu-types'
>>>> +      minItems: 5
>>>> +    minItems: 8
>>>> +    maxItems: 9
>>>> +
>>>
>>
>> Regards,
>> Vikash
> 


