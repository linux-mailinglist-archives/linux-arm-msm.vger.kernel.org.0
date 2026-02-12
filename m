Return-Path: <linux-arm-msm+bounces-92683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAOtIt28jWnL6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:43:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658312D18E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA0B2303B4FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE512F0C45;
	Thu, 12 Feb 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlu/whk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwMyOTPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349792ECE86
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896602; cv=none; b=dpqz4gI/CGGzpb1NLUwKiJ3IsJy2MswBkz5HvrpjU6XXIsS78zTXQuczC1H8k4nYrOs0THVGrttRgFjEQhobNm1nrbomvygfKPDoO5+D0/QWup/T4h/ufq4D7lhkyXjPHOKvMq4dVN8n7umM8xIMsV2wUBZril3E5YpFxeX9h94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896602; c=relaxed/simple;
	bh=/r6h55ep8vDaYXzMjypF8LP0CmRspeweiNim/QcWd1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbXZKBbRUuolLSkvifLrxM80hkSdIIKsHRzFvDjmdHVTtFig3dKKxorclH3qmY+ovFjT7HY2RtGMmFD5qWYlH0P/si6QmVfiGs0W4w8H1rNLEgaw0WirsRxF175YkOKZ5t/dpLLEMjVJty4f97+FV6zmbDPH44OJv60JAwW8m+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlu/whk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwMyOTPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9o5JR3562061
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rE3HZZJCFRgTxa0EFA3Pcd/g06oH1wjDmN+ZLl7iKOA=; b=dlu/whk/+uMdlZ23
	QeDrHnhoPd10GnR7KCJfZixyxdsSgHh7KL2yny0CYdGSEX0zULPT3YJXYNuuFIco
	w9Bh/N3/yyZ2BF3syvMCiT+fbgtSZa6rQ5P1wn6XUD4nyndZFXBL9EhVkYvPSf6t
	3SA3wEVV9QRypbAYRE/0CRVChWo8GkY9ZT22DISG4mBzMDxcUWDPGMKVpJ7H4snF
	OlaJGWrjoJuvUe60yp9tDr9prBQE5a0+FwPRBlhD90QKovCioj9T6IRzjV1RYQiX
	bgEv+AWci/ShXS1WyaFpxKrrnygAcQb26VTXRnMy1cdfg3sA+K0N/0my/l9+QwRc
	G2EWOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2gbg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:43:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38346fdbso14340785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770896599; x=1771501399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rE3HZZJCFRgTxa0EFA3Pcd/g06oH1wjDmN+ZLl7iKOA=;
        b=MwMyOTPNdpYHuyR7lrYCCdptZu83vu0ROnfdRRWoLLsdlsVUdT6fLDU/3T/gxblsed
         VQMTPAS4Id26ZKdN4euquBTk28FUyPZ/V2OdSkZBgftUUtcqFakW8qIxhPdnjpK+jiGA
         ph98VUK7TV0EYZNuriSZdyJKJ/sQct228IcVQQlMWzvSKfW9dbDG+FH1o+9A/R3MNSfJ
         A/1/03KAtYeIopF/KhSFkEFfC2YCWLBBxxKXaGds/svgNGAWBbL4B9xwxQq+KA5dFvxi
         tHfNcMh6TrpMTg3k7XZ+qz/8r8Bm10wlolYkmcXwjSnEsDooF/N7ceiurxJcb5pbg0Ww
         JbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896599; x=1771501399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE3HZZJCFRgTxa0EFA3Pcd/g06oH1wjDmN+ZLl7iKOA=;
        b=p7CtWJSg5Lu+yH5cAAyMUy+JCosy0OaFwZfpVsEvec67b/ABH7mx6vLpcAVthwqN//
         T/4vh8MFZpsRyKMWO5yc8WTrCY+Ii+dVYOufxFTNzDPVgMJ4MwIBkSPQlgjfvxUqmQNr
         bQk9226WUHoGCfomi0pCGETXve67tfW0RASMJI0+LHnlHDRY5XMdh2CuXpE1so26E0Xd
         ZDLTX/2glvhOtWeZLbANe9BYDU9Jj9lyGfqwR0dCJpD/2AtW2/71vGvsJRJStfZGdJ2g
         Bsm0FRyGIWuLQ6AEjI6dvk1mzFV/a9d7QochuZuqnXR3iAynENpmNbKPIejNSnu6z/rb
         Eznw==
X-Forwarded-Encrypted: i=1; AJvYcCWCPOh/n6Kd7/49DH+PrPSuXv4je189SbTpptHFD0ZXxCXIf8qLwzlDcNtgFFEGeXQO/WAsmpZxKXfuaV5r@vger.kernel.org
X-Gm-Message-State: AOJu0YxyZmtGq0BMPc4I6CKZfMwH2ks1xS+P+SKn1V9ZMiOkxsMSKonJ
	mil4G1pjFijH860OerPi4uywSonM1m6mM0WuaDDaJVp/8yOv97d/6jFqhYgbyuKPj71Z6qS5NQZ
	AcecDV8EUvuY/ZhQDmEYseJO0/RJY4K0espIxBqznK4TtU9Mm6HWYUkqCyiw8JQLCC4FT
X-Gm-Gg: AZuq6aKkM7BjIIx/dXyOkyuD5TK1fAqNlQ6Ig7Fr+/1/ssF2KAWIDPs5fu9KseE8JLr
	C8AZaHoltaLYqsIzB5ietan1ltVMzl8Xwkj3DhLFVXafmK0/OTh8tbUtPkWYScYou7w9KBikXAM
	nIM1jOs+OScWVN2ASjzuCv7fZikDWoxWC3/YhhLO2QZbhEIKdhPDIGM3Y9xulrVNU8r1Ggt9n/O
	gqvWxdSd1RkxCiLmms+VQaXd7cc75Zc1Pu8r5RL9jAbW2P/xXKRqOxDc1alEJRYYK9jkdYofCDB
	WDWh6fMV7YsmEhLz0UO9Lu5HUq8/vlsy83C5g0pweMOyNhuVjDsl1jfk526CyasNLe8beZkJzeZ
	it4pL/NfWL67qbK6Wl8Yt9ib2x2nSmODfwFYtkXarT30lg3g5THR3D8S31fvGvY3ZkoyJkX6fyo
	I7CHk=
X-Received: by 2002:a05:620a:46a1:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8cb3315b4bamr224364885a.8.1770896599394;
        Thu, 12 Feb 2026 03:43:19 -0800 (PST)
X-Received: by 2002:a05:620a:46a1:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8cb3315b4bamr224362585a.8.1770896598867;
        Thu, 12 Feb 2026 03:43:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f97e2e705sm36671566b.61.2026.02.12.03.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:43:18 -0800 (PST)
Message-ID: <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:43:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698dbcd8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_qvAbxjOzlPTnpeXTmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NyBTYWx0ZWRfXzfPGnbQNnTzu
 sYTXIveNR6UtRKL9x26cdsl+wiFqSFnh2wQ7DeHo75jOeuRnwf/xViruCSGb/c/JUmfJKi5ivF9
 kSSAo28s2cVLJKhGGaI/NZs1KzmTwWG6rPedSG4LNzhJAE/WnqfTD4kA34FwLICm/73lzZJUuJo
 0mduSIG5cjOaRpI/+WJzvzxW/PFH6uw+pYzmUOXKs8v3zowtV+TD8N9ccFEPD84T7ZyPyrZ8Eln
 fEFGw9HaptXIeen9zsM1lzV5yhn8NOmvdsnAd6v9PQ3vOi+qqKeX3ghuELsP2slFBqDwQO06e8L
 +KaflQToNL8kcu+I1012JGnFB5nD13raN9ol2EPwQx5Ka5+QeVxEmwcOEpfGe8028AHUQKpiBd1
 tLa9KnUO9/29WhPBj4SNmb/d9Tb7U5EnhJMUmh5/kHLgZGPPG3j0GzaJtAilZ9+D8E6s996DMTh
 N1eV4CF3waNtY4kbE8w==
X-Proofpoint-GUID: yY1aZnwQ5DZ9m2Imot970eTlI6hxeIui
X-Proofpoint-ORIG-GUID: yY1aZnwQ5DZ9m2Imot970eTlI6hxeIui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92683-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0658312D18E
X-Rspamd-Action: no action

On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>
>>>
>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>> 'firmware-name' property.
>>>>>
>>>>> Based on this property and the availability of the referenced
>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>> updates its platform data accordingly. Boards that do not
>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>> automatically fall back to Gen1.
>>>>>
>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>> ---

[...]

>>> To avoid accidental matches, I can switch to an exact filename match
>>> instead. That way, only the specific Gen2 image (for example
>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>
>> How do you detect that for the OEM-signed firmware, which can have
>> random name?
>>
>>> want to use Gen2 can opt in by naming the firmware accordingly.
> 
> I Explored on suggested alternative approaches and seeing some limitation
> with the both of them:
> 
> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
> the version string. The issues with this approach :
> 
> - the version string has no explicit marker that identifies Gen1 vs Gen2.
> 
> - This prefix is not a formal ABI, and it is not consistent across SoCs.
> Each SoC family uses different naming patterns in the version string.
> 
> Example : For SC7280 Gen1 we currently see:
> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
> 
> So the driver would need SoC‑specific string‑matching rules, which is hard
> to maintain if we are looking for a design to address all available SOCs.

The only SoC with such distinction today is kodiak. So we can simply check:

if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
	hfi = gen2;


Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
solved for <=8450

Konrad

