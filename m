Return-Path: <linux-arm-msm+bounces-112501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkrYF5BuKWo0WwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:02:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F466A0EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:02:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IW6ZvPuq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HiyKtUMu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112501-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112501-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5ADE2303E279
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3629B3BADA2;
	Wed, 10 Jun 2026 14:01:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D3246781
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100066; cv=none; b=TQCYCNQ6X4QpR3d+bms76vjmbSoauhcPh3QSrnB7tKKqUfIBGdZqo4nrvXftXP4Rp3iYcBtCdlQOWxyVwDVvHu2/GKOLDIQ39QBafRcMKElDKQc01hAMvI15EMh2YSC51PwGsCDRXXBFefjQ24VHzCTTSqbEhGAK185tw8Ob4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100066; c=relaxed/simple;
	bh=dICuJUbKjN8yyJmiqAFTChqS0W129mTdI8rEd1NL2mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4/jKWkjwjp2ZkHE/qCSN//4GS+T/1R1h7iYY4M3jpAzZ4DqPKnCjhmfKeyJpplFsaG2CqoMCtIOPZup6kvjnz6nqHjeDSyjx8qeBrmhCE2w0jy9FFxmeoRpwRqsKRMIfUaDq2xl+B8Q5P8HiFYVXbzxAZuhENc6JP5RKdehDwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW6ZvPuq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiyKtUMu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeS91137390
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=; b=IW6ZvPuq4JXEPrBg
	6pG9lTkxZ9RqTQeqBEviwT7ywvq7A7q84wRG/glysXFxe6VnvV+9ZXwWU0BwOKQn
	olDaGUPryiynnhNV2OxUtN34GoD7YIAfHqf2I2PBqYT5UAfzobVa8miy4eX/pizW
	goK2L9iRMabLYt271S/WC8kNFOE1sFakSC33PUxdvgI5xcGDawF1JqymCWYmaUBz
	bo1z2V5pQCdvlzFjPErKP3isi8pYhJQUnzWIygez+XRBJvsiFGhc7tA6DSplsain
	RsupaD72z+SnFfgoh7KNZVe+5otLsmPk0jduROq3iY3uoyg3X1KksJml/RV/O9A4
	aIdyVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2t8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 14:01:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so8768491cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100063; x=1781704863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=HiyKtUMuS67p3iBpqFhp5i8LCtH4SPgrUMTjA/msP4kZ/mTFjZXC6Qc/plDnG5ctGx
         G02zdN9PBXA1i9PSI0rZht+XRYI8U5yklfcLv5ykR3KE3WfbUkp4r4CGDD8dcK34bQHM
         PxvMpDhIuMCiyZ9oI9eHKkAukX1hNMtaA5YpiQHfHtY5CjP1bVge0IENFz7pSMMNHh/K
         /r6+wKSxlZhO+DAwRc2G8bzamrXgtU3QWIvbHodHNictXSd0QaI3SUCLEMywkeklpsW6
         pcnldDMaqic4MwbPHcjKo8+/KDTqYNT1BE3daHNUOXZ8+7CvJ8/3NBsuKVwbf3GyhWZk
         jsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100063; x=1781704863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dszW/DFBP0oRONJf2F/W8AVh47nEouB1XjBuJ8A7lfk=;
        b=HvjPVFaQKmmBoR1Lm6JRQP5szkGMpum61KQtV+rPAb8nfFFKLjroplIY1mH34GEjgv
         0bdlSwTnRYpLhUFHpkLHZ/4t6xk5DchxI9CtB7z4GnFYWjWN0snyrz7JP0L0Nu3z0vFJ
         RKeHbbTIwlMM6QWg0KUdsxxMWeAXF7lvZVHMkrwpkBYzxlV1tGPkci09RXe1K2Qj42Lr
         P4/PXs9iZmvrIKqdYBuv9xW8odbDPFdted5WYVL4a5twGsUUL9pYjlum6pPDl5QJeRZI
         E/LIs5fqpOrePj2JyfTwMBJ32jXe0Dgv8EqXI9r+3I5Bc1np86GOtY5XnPyq3Ia7P/WX
         FwJw==
X-Forwarded-Encrypted: i=1; AFNElJ8XJwp3FObGEl5rN0DThrx7I64RrkAXsAX/QsX5KAv4pQLSbEEIU/WtUtmMMFoqEzAFwMVaHOfHWQBckrcK@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYI2uiJCHusBigO8GBclqGBSsxJdPVk1QsKEaKuz8vBHn4slv
	E5KfDVudE1dqys6nPS5BWhWW122xom61WC8JAavmNcTqJjLBUsUPRxvO4a1e2FwJHwgc2ZL5QWC
	Rxev3IdUu6F6lJWJRcpqWXYc9+w6zmvf2w76/twB7JxEeFvczEyOpSLfEec3hQQA/CPzW
X-Gm-Gg: Acq92OGRina4lXnVzMGObz/8xPbqmKJLqGHY0FELN6cYNN8bwWXqJLiMgleL/bFbt9M
	7dKV1iWc/7ECvFuYQNmQrsBLCni8FLID4mIvCT0kYtxkUQ+CA8AsV3AbkyFToB1vjZI0sqrm2wW
	/N+2JIpPb8BsRJ0K+GnQQ8Bq/wqXhoogBNwAW7mdY4itkifF9D0i059EYrsY4U0dJPcvg1vg7m0
	549HZpQnlWpHJRS9PRFti/ygzBkEL3E2etpdTsz0UmAmG4QrLU1jIDEXK9fOIYJyaBhavVV/2ck
	fqZ0FEZ4IeJf1qLF2avp2zw8K0VY8q4JzmjB2N4FJq5Jk4e547+go4MG+k0B87o2LBkpDg8pjBP
	BzNFKqOV+1eE3hf7UzpTpxhq4q5tIf8i3EaBsW8S6pPlWPL9dyv4LnDZB
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76089121cf.3.1781100061437;
        Wed, 10 Jun 2026 07:01:01 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ca3faecemr76088431cf.3.1781100060792;
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm1195871966b.8.2026.06.10.07.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:01:00 -0700 (PDT)
Message-ID: <6e46d3c8-984a-4a24-8847-5f5b6bb9d51a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-11-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX+DiIzuBAw/l4
 XtHAyXDw1okD8QTFLWVHQyPG0UEtTerUFPpwh5O4FKq45ZttjNibiGmc2A8nJYXbRVbyYvPeNz1
 rqgMaL4H3Gdi8KcntBu9RVfq3X6w/K5FnIpnG1SL9qbF5Bpe/VNScqbngPTfhfjXdWPwN1Y9lJa
 +wx2XKwsA3l5a6ZBW1BwEf6wowi+HA5c+LQH5acIBIfNejiR0RcVTTG6Csg7u32o/aKE5IgIKlf
 n2tAs1v7sB5AyPL7YgvGOsG+upNApy3S7HBu752FZnqCiUgAoZ6jMHSJOZa6JyR0qFG+ybq4EDJ
 eL4/KfVEm3qhPPIHI8ZQxRmtaHEE3Yn0tIsWD1Qn7HVZLIh1yKM+KRGl+YIdrv2zIi2HxVHnIQX
 8GKMs8mPPEAeJwM58vwiZW2R+VZbvwVm5HWSwEVEx1vturi+nP4Va0EVQ/SRPCuo6fsludtbpye
 uN5Wyz164cCLzSSbfNg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a296e1f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PksVV9itEkcmu87ivRhL7s0MpBfFenTF
X-Proofpoint-GUID: PksVV9itEkcmu87ivRhL7s0MpBfFenTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112501-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F7F466A0EE

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with minor differences. Hence add support for Shikra
> GPUCC by extending the QCM2290 GPUCC driver.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

