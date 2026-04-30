Return-Path: <linux-arm-msm+bounces-105302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AaAGoIW82llxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:44:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA82E49F5CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 10:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99773030EA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E683FE379;
	Thu, 30 Apr 2026 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRtZSpi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRe7ktX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0F3FE64A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538423; cv=none; b=GUHYZzi13eMGC/oqwNHf4J1PNgG2Qcr5keu9aShtJzdN98edUaZo7tQmBcooMR5MKOOpAf4nV9sh7NHtA/5vdZ/KZGtbmNTvD5Jqd8QKac32a9u6rlzgoPxUwPnQz59YpVbaMVNQn/eizWTkHmmPWTsQcZupzW9oCgOceRoaJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538423; c=relaxed/simple;
	bh=B3RTdQVdT/TQMBR9Xv91ApyqkspQ8nfdAwtAMn8Gc00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTk/0NGJCSWN7cr8QnUlWdNX4/kzpojvKcAIneA1vdqz+LeYc/NfuIP6YJfIxOnss9iy5tazvnbxFSsZ20ptgwdMzvAMkcDkB0a7fNL8bH5QLrKEgoxorWfduJW4nQTkn4hCK3Sga3rvARAM01VeVIxZxVxth2gdj9dLz6/QKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRtZSpi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRe7ktX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6oQdx3886219
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=; b=oRtZSpi6X51x0jtE
	lj+AGMxfn1+IqhM5nAXB8bPgIFSEspswIzjTogJUkYSoaizKsTquuKFObeiAnfp2
	vxg2hjULj5Dqcx2IWVW48oBC6fvFSOvQEuZUzX8pxfgOt9Ak1nCSk5Kb6cVH9/MW
	F9wqYoS4UF+bIkthl2X30CfmUENdi6AJ6duq2tFzyI6/VzdImvDCvGAdC4LMpa7b
	ye1EWI2QyWZ5R0xjfokwTVkaEAuInw2ixjf3kGMhzUweogGFKbWWsKcusF12MeLu
	hF83IOtr6Bn+i/mdZ+veGLesaAq/eQKOxwqOf9A6kn6IfM1F/uiOOYuoMDYZMx/X
	TqnZow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmahtmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 08:40:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso7373265ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777538420; x=1778143220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=fRe7ktX9eZq0eP+kTH1hhVMkHXdNwX9FBu8/uPZGgLZ7cYAtZfTbv5Q9zwhvkkuPKE
         30lWr7mMILhUSdjXVuWrF15e8FBKF14DxZu2hlE79RmpfoFAlaX1RK/0vOP3n+RosYgs
         rEb5fmp62TSMNZFBBAeq++4b9dZKaHHJaH6xeB47+IeBP3b1CvRFwehoRDvJ84R7UEdX
         iNukwMpp8aCTbZfl2aWa+9BbQ3i5ayT7e6712QlWPTAhtECTz6x1WUGZx4mDtYGthrA/
         boyZigK5Ut+kOVnBfUlC3rvrl1+V1qJGFLD575Y9Ms9HvjYrHszwgXfaZ3VNP+THcVVZ
         iAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538420; x=1778143220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqTeQVb5il4BxWLnjLGKpxyBsOw+axckYHeHHInI9FY=;
        b=DrYGWKiZaFAhNioiK7fWOmy6J0Q8lzsVohU6jR69UtCcLQsRGTbIi2/pzJkkqi2JBn
         9p5lr0uIdfvIiCVokBRKVufjXkWk88pEf79CqCOKjnJk7+2taJhafc6RFBeG8odzYjxk
         uTY5AtHNysyucDOtQ9L0POtZ/6TgaOtRUKqQZoPL+KOs9sdL5KTKhnd+UuE1wpK8dBXU
         KW5E9cg4vVWSOkwu3rhV9zKktW8sm8Q3g8OK7YP4aA+UFDXV5snlZW0kru2ymTFYDs2y
         VgQoKQ47KttVosIfRC84GSTINphH094pcsRXgrHmGGqkq2AmQRT3wj1ktDoGNyRRKUOZ
         M37A==
X-Forwarded-Encrypted: i=1; AFNElJ/XN471kA5sLcq/f4OJzLY/pgLzFVPyxorQwIdbeodXt2M8RoLLVpTbRhLOGyBq8Y1r9K4NPYZcgVm+ICPB@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIv4pAgRV+74UzIRsGsm/EU8AKl6RjQ250qt5A/zTuTUdZTdQ
	R6Fs+ogpMTuziPkhgPjR+KJIy8YipJ9HpKbZdf8AdG7tpEjUL0ai9uV0GlORgpeVSEnqOa27Z9T
	Zi+fTHy9od34cp2YJB/WbpUV3cPsAHTQ5XH9j1m5bQMgx4hHVyuNYNm0Jedf5gFE+QYeh/Ho0Ky
	f0
X-Gm-Gg: AeBDievKoLEaHVllGbdMhwLEvTzwgfMb07+0AzjkCciy01WPkYDntFfkO9LSC5tqSTu
	hw9rDhe6tCkwzeNZmMxGJhsDG/nkBI7Xtax1WUMlsnAADSF5TXpg8EddVuvNajSMrVUw1sGYJ1O
	BkqjG0fND68KYUBlXqKM8TL70FmI+iQZ5OBO0rqkZ7tptd1LWOn2j4G/omDrRnGs0Fhl9mc4vdH
	fXS5svgvatWk4ti4XV24fuvv6z7LpRGDJNKSsQWfzX4+rRakwsTawfeS17Xj1pztg0r+au8uHHE
	NUldbc1YDvBozkk/hzpf/qrGUYC3lY93Z6RYFP9U+CvlIj90Ao8HMQb5WLg2ZVRu3Xk0IQSgajZ
	9+mfNwDxktHuKhKJOOCD6kj7xQrurXkwb6TDU9hCCJcoZ9DGFC3RiorQuz/o=
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136845ad.9.1777538420036;
        Thu, 30 Apr 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a17:902:c949:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b9a231ad36mr19136485ad.9.1777538419530;
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f132sm46236635ad.49.2026.04.30.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 01:40:19 -0700 (PDT)
Message-ID: <2efc6a84-cbae-4460-a0f9-3712da8c33a7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:10:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
 <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <6f76dd8a-2007-4012-980f-268076fff5ad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bw61xi59SOZqNazxW_Ga9hNUjD3yq634
X-Proofpoint-GUID: Bw61xi59SOZqNazxW_Ga9hNUjD3yq634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA4NCBTYWx0ZWRfX+icfoBiWVrNe
 jc0+OJuvdnuhPtwO+iIX5/X+TP601SYAmAICsNjHspjA4LUrJZqfIH/ihKGaw4r6naZ8IG2Un3S
 GhuzXESIy210V5XUzBd8P/P2cVqdMauKpjobmfodcci3qG75eoLLc9q+DTJYLBffL7n9TiXrtPa
 TOw+i495qu0ryMBmh0qf2/5vna4tPFMxmN88eVaep/rEm94QMbXB3yWBauwLpikzSUEG7PW3Yyu
 wpevvYPPCAPZVi9kuogolERQpAogoV3FIZBslcB3333GqiMfcWiCfhWeOa6WNFa9osaivFr2aAO
 +HjKVO199Yejh+AaMAF8w+9VV8E2ZKoiyaVTAW/KvVrFaxHpUYFDWWsRXz0SDxKSxSOlCOFudQo
 S+tY+9P3pvf8un8FSheKJ3hI49ciO9EBLiI3fabMvmnChTavzqSeVWh8966Y2SRoR7pBfBKesc7
 yOtG23OMFFKk8I3tNPg==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f31574 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FE2aYY5kXyuWuzusOicA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300084
X-Rspamd-Queue-Id: BA82E49F5CD
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105302-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 29-04-2026 08:02 pm, Krzysztof Kozlowski wrote:
> On 29/04/2026 12:51, Imran Shaik wrote:
>> Enable the Global clock controller driver on Qualcomm Shikra EVK board.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
>>   CONFIG_CLK_IMX8ULP=y
>>   CONFIG_CLK_IMX93=y
>>   CONFIG_CLK_IMX95_BLK_CTL=y
>> +CONFIG_CLK_SHIKRA_GCC=y
> 
> Beside some really odd order, this patch should not be needed.
> 

Sure, will drop this change, and update Kconfig accordingly.

Thanks,
Imran

