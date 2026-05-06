Return-Path: <linux-arm-msm+bounces-106102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AxLHsUc+2nSWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:49:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E94D97CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC46B301952A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 10:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B919C4218B2;
	Wed,  6 May 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhtT+LYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVL4kfzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC5F3ED118
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064481; cv=none; b=SvxjGwzbYlS2IYIoWNJ3rpF5c8XN64nV93LZfNRdmFDW+SXsTyuGAt4VdHoHr2KHP7alP8AibwWkLRqRpEXk145cFJ0jIpmBs4D7Y5UJDgSitN7HNHdkyHuNDC3JJglCMJcrknObpz6zF+8YtMkVjR7ByslOLc67ps75Sw0QCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064481; c=relaxed/simple;
	bh=UEqhS/gVtOtsoOlkx4tlcpnnBFw46fyozlsFkaRqtwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlL8gOM/xuNuZOutUvm84B3sRqPLcU0/M8DcZVZz1zPAjcQ0G8/5PBCibP9ChWNN7QiywNnXnhLXyhKrzMSTEj05lBoNAxqZvOBZaIhnlBlKGJiqnpsu0U5sYce+O7okPiTg3CkZuGXTAXCADL1cFgs2h8bb1uNXtHmyh+WcxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhtT+LYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVL4kfzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467ChZ41527956
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 10:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=; b=BhtT+LYlUqoxEnkk
	xnpA6WhgB0YM/ZnqDxSWzhVy7F+iwRRTL7Y1I8kiBpFeQvq0rcvrQE2RKoDzvr2k
	Fx23YlQlf4NNAurBFDTRS7xjbw6N5n0B+tE3qeedn7Axqx2lYY6ODwiyWBYT/xkx
	FEpgcbPDmxMFqnlQ6z6eRLXx9fjAa5+gmnQ5NEkDfKijEvvuBjykSsqPQKjq6hv0
	S9MTxCqVQMuuLfbaGFsP+fvlf9Kf/qb0UXMV5UgoiIsD68seEKTWuaBzH5fxOSi1
	KBIpAUeL26ty1ek03jpIL8J8eU1NKahhis3OwaBK61vZYctRWx1B/3qVlCrm7bJu
	mxiNaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288vau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:47:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb6880430dso178228685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778064477; x=1778669277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=;
        b=UVL4kfzzba/HZxvCMcFTg+w2EycNyu4+ULfQeMFznMyNr/YdjVoW/BrkKdNM9O0mmW
         T/nq02IZX0P0OtLwS3OdI3FpuzWW7aQc+lknk7UZ51Z+6kMugqcEPgHxg+mCq2yeTWJ8
         1HC6NvO+yhtT8aAWcLaPEouTpCn0dGZNTiQ1BrR+QAv28RQZ4I5Dg4KnFBWbs8xPDwry
         dgQrev0hU+9zH34er5v/hTf6F22MOUTZDh6L2r+lNQPqhu5Vv3vypMXewnuZzv6tPlO1
         Lbl1jjtm5UWCRV8wiMWboldIwSdXJemOOwn3Bio17ywNwqXNvGeulMsOdnB30DZyyR/e
         sVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778064477; x=1778669277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fyr6BndDsbD/gd4UCCwHZ07yKpNDj6vKJfz1NBHwr0c=;
        b=S+J2LEVqPfV1QFkBSdAs8p6Z+OG9feiWOIXnbl1aMw7D87+5gpD3wrc378jJ0LwzsN
         OvMPGkBAjJvYb3V83NQv2ND5mXFEUt+TJymEWzvQuKDsw9JOtFc9WcGieUqRTtL/vOiM
         6Z+fQCcRpQeP5u4hUXq1WQnVffBYODlH9wwi1BOcKyqhnimpRv/0uVwBjbmg4+fdrLUr
         hB6kmy/B9MfOZ6qW95e6YC4BTBJEROU958Eur0EjH1E2E79yKsFwfRgJMPgWGiVFRTeb
         hIy1h8uuj9XQAQHrTPzWccc1pytCNEBA7ewux7pnHdV4w0gDQCPQYA5lOZqw/ll8eDz3
         ECIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GuZi/uiSlllMnauEa2L6t+szrqLib3A5kNVc8XjDjOFQIhoIuw7Zok3w+D9tAjstE8DEainYVRn5e9gnD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ij7iwYZTqNs/WWSIch9Nn4dTAlBEtxdtR0Baza7zeN+3lxwi
	q4fIq1KIp2tgqQEshCw3c+GNOJQID+PwVvsF9Kuoci4ywQlZAnvJh9GXYItrQe5kmT0x8jHWury
	FZ3+LWF5Yx1WpbzW4YV49vu8HoZxGOpOzSy7XkTNrW3/8xmAfccae3ndeZUBxelUhyTri
X-Gm-Gg: AeBDietaIG95ztLusSsJVkwmfhTdWUuuQlVhu+E8a0lfj31ss7LA+CtcqD9wiGoYPOG
	lxJ+ZjUM6TI9JCGRaU48Z23ZKVNY0HlkXqfI07g0fybcaSg70opf8+Xemgcm81OkpRDe0EQLQP4
	h0RuJ6bV2M8wJAfQfMK8YFilarY4FT5E4gIxmycqptXzvMxvmNHkImPCTl0Sfu7psB0sHBSowlr
	zQPRGv2UFNMrCRyUQnQhCgf34Gq6MzDUTJeZ3qFg+Ee/ZWiHkAa/KHNEyfKFD4z6agpBafg1Chq
	kku6cd7rsgLGu/Ag6zDTIjFO57b2HvLnEG/GhFc+HvHs+yGl4wt71ZxOvrHO8q5uEMrjaF7/L4x
	6GkYIJDRlgLgkheA8QfMNFZ9yNtA5R5ATczL1PvsnTvDRrMcz9azB5QRq/VAw2vNp5doEtoL46M
	9izCYLkdpmd2kf/Q==
X-Received: by 2002:a05:620a:472a:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9051daff561mr168915985a.4.1778064477613;
        Wed, 06 May 2026 03:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:472a:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9051daff561mr168913385a.4.1778064477181;
        Wed, 06 May 2026 03:47:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a486csm1116640a12.17.2026.05.06.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:47:55 -0700 (PDT)
Message-ID: <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b5swasgFO2DnmoTVJ8PCjEBVrLyM-z0E
X-Proofpoint-ORIG-GUID: b5swasgFO2DnmoTVJ8PCjEBVrLyM-z0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwNCBTYWx0ZWRfXwvvQRHvHw9rS
 GoYDB82dV5Bfl0ojdnFJAo7OVazrUG4m30/19ivhif3g8HGzTxPhklpslkKtEI8u3yVOJV7/tfF
 gYcuDTXeJm6ReU0CWd/mPFKIk5GW/zGbkVgzsCeH9dq6q33t+Ws1o1Ng0mqlQMcxCRgRnDBCgTo
 65wHEGRIF+10ZCPSMo0VGborx4oNwrvCKiIOQE7TVBBeEPkEOwR70Y8oKLDIRZXshvUR+lZuhsQ
 GiemmpE9q64iKV37hz4/KMGO0/iu1FhYNdJLIEBp89iQku1yDQuHMYKMkd6j1BgNo3WIezbDgJM
 RxFvG6oJPq5pt0iI+QnysIB+Y/rjwevbmHsDkL7vbSY7q/z0RjlMUxr1pbZekt6p7n3VPUycqdm
 Oq9YFs9QrdZCDzllVzTCxu0eBt/ETndfurRIJ+wHvrAC8KTqQVeb4pmjRni+ffjuJYsSbFLG3Fx
 AW+DK7yjNPPmcFH2O9w==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb1c5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u3ptBUEvLvOtx8rFk0cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060104
X-Rspamd-Queue-Id: 250E94D97CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106102-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
> On 06/05/2026 10:49, Konrad Dybcio wrote:
>> On 5/6/26 10:25 AM, Krzysztof Kozlowski wrote:
>>> On Mon, May 04, 2026 at 01:00:07PM +0300, Abel Vesa wrote:
>>>> Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
>>>> base register regions and an additional AND, OR broadcast region, total 4
>>>> register regions.
>>>>
>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> index 995d57815781..90f5a54b76e3 100644
>>>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>>>> @@ -20,6 +20,7 @@ description: |
>>>>  properties:
>>>>    compatible:
>>>>      enum:
>>>> +      - qcom,eliza-llcc
>>>>        - qcom,glymur-llcc
>>>>        - qcom,ipq5424-llcc
>>>>        - qcom,kaanapali-llcc
>>>> @@ -341,6 +342,27 @@ allOf:
>>>>              - const: llcc_broadcast_base
>>>>              - const: llcc_broadcast_and_base
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,eliza-llcc
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: LLCC0 base register region
>>>> +            - description: LLCC2 base register region
>>>
>>> LLCC1?
>>
>> Unfortunately not
> 
> Then let's just skip the names, because it will cause unnecessary
> confusion when name is llcc1 (since it is the NEXT entry) but it points
> to block called LLCC2 in the manual.

I don't think skipping the names is a good idea, especially since if
we keep them, we could teach the driver what channel the region actually
corresponds to

Konrad

