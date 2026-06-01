Return-Path: <linux-arm-msm+bounces-110490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ANxAjX3HGplUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967F61908F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 05:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62AE63006B4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 03:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BCA238C1A;
	Mon,  1 Jun 2026 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eiv0R4Xf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1m1/WHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB9523EA9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 03:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282888; cv=none; b=E0Z9+Pl/iF0Lmxr6RGI4bHRECQBWuwEDJp34Vb5esCIuHfpYYqY5DI1FEdsbTUx72hMtqWCeGQf9pKvJHwhoQyid5Z0zf/etyRCiMkFAsNHcGMxWp+n3L+E4NqnEBJ3vqxcP7SvX1dTar2QLB06VQXxvuTW7yNrSYnw2V5ijrRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282888; c=relaxed/simple;
	bh=V43roggDeue7KGYIxDOJm5DBfzT8v9TGwjS0aX/8l8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8yiMaw05kxGtWWfSi6LKBtqyjTBW0tU4uUKacfIDHYarEjZe3vQCrPRICXRop5FWhOjdQbhjdK9E+PgUrIETmLyLzVmpkykZ0iZCehVm3q/rfPR6uxAQ5fiaYn7/E2LpdjFHKj6ZM4qiW+KJJidaqKM7w71BFTI6QqIHFdLqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eiv0R4Xf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1m1/WHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLsGi44050258
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 03:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=; b=Eiv0R4XfCjL2/s+u
	sCliQ+wCJIF51CIwJ7+eD+JsmjOR11IEpy2lpSU65GfRo8Mh2UI4W9zWpNy0xkOm
	OSB1ttB2d0uKtJf3G32tdV2aSqzu1AYlz5vF6X2i1ix+6cFpmemObcZg79V4fHFN
	1dcRu0bS+NB3KsiSIjqJ7ksvIKLeMoQ3Fl+nIwOXy+ZYgDpZa3l9Dml5ttvdtgVd
	D5P04boDeWl6hsSUTrXFBWejYrjX3WicswND/jyYTIH4pm3oRL2k5t+z1wDINmw7
	iX1QWM38cC18KED/Jwtw0xkVvfiiEswkP3+7v646bXiFCyyNdePBm2aZaLVFeFUB
	XEHgfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux54w1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 03:01:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf243973c2so17802865ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780282887; x=1780887687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=O1m1/WHqnsR/8MTBCJ5k1+4321MjwCIgIb+xfFm0lU9M/Dn2KudMo3FVa59BXhFA+L
         Ix/XKXJZ41kwPPp1DiHjWGrTlc2PY78hPTaxk+BDUOLte434zIM3hti4b3KsO22DvLsl
         ATFJZ6c9mhpmrjvQY93hsZ/Z4AC7ctYnt4QJ3hd4UDdGAAhmsAAgkdJ/+DOqGUrV3oAP
         NNy3kQn6kHNtbIocyRozNvthRA+xrynb0AOc6xIrLujEffPVMjou28tNDWvuaxDKBhHE
         j3L0uvKp3RNZ9kDZ8vpElaYdLrtAtww2roGNbHpJw1wSE8/FhKO636oUTcpywjgiLf7y
         p8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282887; x=1780887687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=sq2FoHT0sn3qOVwMlyGcG5egcJw6G4ZKc+ZgPIsn0HNBVIZo0qn3mEFIKwqOZrQUVD
         1++6cDCCbPrkbScygFOBRdebGTXhLwuk5Tj50XlcccEue2c6K9V/SpLbWd87pRxm/pJ+
         jyekufKq4a5TEsyi/yS//l2otpXyx7GcuMnRux5OF8XiZEmmje2T6S7nYL8PZv9zkbQq
         1kQ4zcC2u8vaJ+h7b/Kn0D5OTFt6xCI9lg8DHq7hr9Vc6J0PtIhEP8y21dyUYKQQZsNW
         fLyfZPhR9l2h8Bvkl6PKM/E9gUoZcEdRXsceteU6KW+ZecLncpW4Zo4WivxVUclsYLw0
         DyBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jUl9k2VgqexHkwlMzniqyg1Ej8XQBDd/uQUuwhCetgFWva5TY5Noeya2ew8/ZLAAfsvjxy0dYKYVDGQxf@vger.kernel.org
X-Gm-Message-State: AOJu0YzycRiRgtWA3aSdvPH6lmWh4ULpAxcpBqwk7ZBNbIID7e8dWc8I
	+uacUpuQgVAD58L5GiiZ9ihq/ItP2LNBnHXL6idPn9sYnA5VbWM3DzZ+D3CVEhV7zN8jnMRFh9F
	987+lGPR7MOo1mcgx43UH/MUrBmgl4M1k/4K1/oLyAV6b7NUlg4AwXnTM8ZtJqBsAgcWA
X-Gm-Gg: Acq92OFeoVlJPsYBxTlyB3TUuop9zvx6PtpsdkalbhXkkNNCsiB6rmwc6Gu8NH9BBus
	/1P0SMyWZ+LfHCU1ALLbODP9OvArEkIbupc3CfRv1p39woLlVSoJzymmdxn0NOYQYqBo10U/8yn
	NIAw7KajcrxUqUvymEVJMuDN1jKDikHCgURvILEiPo7xgbKWawQZsK3D29vF6a2cZGQ9SES9odE
	GF4xdIwXoytceF0i1SKpfv0ixaYhwXRIp0yaAG3tZOwp1RAOW6n9BsOh0LqBXKVlzYDML5a56Uf
	pY0VYLCkcAoDzosUvuntngyD9xjgOq3lf6TnbSeP8508X8psuH5/bCgT19HIrm9KRPFOju7ZTMO
	tDQjFrT56qggb9xcLL6zBPM5A5WLisQLOHXUYaLh+/bC0bwtewbA+Wvh6QsU=
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526857a91.0.1780282886616;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526823a91.0.1780282886129;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm9545856a91.7.2026.05.31.20.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:01:25 -0700 (PDT)
Message-ID: <16d030b5-5e37-44a3-b879-e016655705fb@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:30:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
 <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 36ZSKaADjDTaBSLGIsZI-NoduElnTApi
X-Proofpoint-ORIG-GUID: 36ZSKaADjDTaBSLGIsZI-NoduElnTApi
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1cf607 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ywhEO0bdmV-DYKbozKoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyOCBTYWx0ZWRfXzK0q6bq72Ynt
 Z4uALvsZXrK0x9TgW2RRBHKEEAswyPP6pBuuLsfZXfZYOCHkFChGGF8dd0yrFh4V3same79P+Di
 CGGg+rrnPBPaeUP7rl/4Ja4h7MnQhPRlZGNtSM6v6rdqdKjHenlWGz0hSpDXUu3JKRRmTb8nXn1
 ouqNy5b8PiXjCdgTiD0NsjcLwTss4YYr5nMLqlvHjxLrUoy31A2nEQ8XWO2In7NCEersQ1Iy5Q8
 mLVR6oFfOGjfXjQR2VNwOMCuX90MrNBWWaom/b2va2AGZtTpd2PuiI1v08PsyVW6Ojzls1gc2/N
 HnvD6a4n5rMi3kfhNJgL7mh2Ul2U3CDxnYXqY+3oV4x95Re8C1ZckVLdiuHbGhlK3Og4iEmvtSX
 ak5uPaEgbwgNtrmwajiIOBNdwR+lLnK2q49LK2dALqAjAH/aA3H9cYZs5AC9xtDpuxjpNLhTflE
 fkmIkWChy3TlwvMTt2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010028
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110490-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5967F61908F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30-05-2026 04:59 pm, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 06:24:44PM +0530, Imran Shaik wrote:
>> Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
>> Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
> 
> So just squash into the dependency.
> 

Sure, will squash these changes into the GCC series.

Thanks,
Imran

> Best regards,
> Krzysztof
> 


