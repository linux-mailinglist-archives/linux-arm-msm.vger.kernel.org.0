Return-Path: <linux-arm-msm+bounces-91405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMsfOSMNgGk/2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 03:34:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89834C7E38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 03:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D5273007E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 02:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E0E21C9F9;
	Mon,  2 Feb 2026 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhj1aYDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOQW0NkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4014EC73
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769999643; cv=none; b=Vxl+J8HGksMelXA0J50wLkXAa6iuhh2zAeleWGbUaQOvlx+gNPOmObrCLgCQ6EdJiD7udeRfTZ5NKpbQwwm9ZEPRE9CK3zDNb2cTk/zRhAafS8A0/oSEUA5H+yEufh1EEjVhkNeVns4MhLQhPy5sVmQKqeHbzn8sFQkbJx+WFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769999643; c=relaxed/simple;
	bh=MELLcgdTeOBlLGZ3a276/DZdy0/3FkE+G/AXRs7LIa0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M2jqOo4KYH/AXkFZCDPULO6CFWXiAO8YvJwjQUd7kmnOEbh8RIM2Aw8igXShXFUuMdabCh2FiuWnI2+B3vwiY2C8+K+rEKzNX/RDr41u1mibw7cx82Kdf3l6ivy5zy8Uisn7VwQ5KvCZGxlNtOhSAZeOBwQRDfWKq74M/ZSOMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhj1aYDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOQW0NkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611N0RfS2367015
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 02:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSc19jatgyhABbwDQVcf+MKfLDKY5uGAjHAzUpJQgQM=; b=nhj1aYDSd14WwhKc
	WGNcPO/UK4ZDveXpuZJjGcm3ltYuVJPcbvdrV/r/7s54ErUIeNUwQAGpu/kioM/S
	OZ6OBXsmPcT3QKghwCUkoOJfT7kvjXpSF2AG+FiHa3GyM3MvMPmRsIucaT2h3hc+
	/G3c3vHiY2pWAH/RNI5zIMobUNQjEYNehB3Tly4lcBUrcPzbGKfJoUa3OkTvH8q/
	vC8cBKafkXZF0tkMsOJzbNo6xLMK5Wzm2Jd2LrHO20YgLf1qtP/Ewu5FCUzkZUjE
	wPAA5WK95kKKh8K//6/dwVj1wDkC3pHo6MdCVMmTwe3fHcPOZ2fxP1nxtk504cZq
	3wmpXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard3mr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:34:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b724ff60e6so4532102eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 18:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769999639; x=1770604439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KSc19jatgyhABbwDQVcf+MKfLDKY5uGAjHAzUpJQgQM=;
        b=UOQW0NkErEVJZajTqOr4dLY9RP4OxakqZjeLWJ0Vu1QaP94/PEdQ+dZ8Dl8ckF/XgX
         kvxQbsLHZTRGchuYheR22A/iaN7Z3MXpp6tDpKKq+D7x8aCVxC7mfGGLGEaEVZA9luXK
         nVdXdYaj7uxXROynfDFW7RbKfbofrTM09ieYF6EUmsxcjAyQOw0zEnnrDFm7O84KnA98
         tBH6Or+ZUAI2vJjtguTuLIVb3er/gap4o+C/lnqR3XD2BR5rw5i9qJa/c7sWkKbL6KJ5
         iBmaBS3Zhi3LNMF+6Mz0VQgbw6sYN8Mm51MPtGKA6rEXwDOIxxziIfkdAPJHYbSCtwzB
         vfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769999639; x=1770604439;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSc19jatgyhABbwDQVcf+MKfLDKY5uGAjHAzUpJQgQM=;
        b=CvYsSCAUXlrSPUBb4b6YrXXLQnxjPw8DJNtZ+7006ixFG/9Oqrvzg/cm9+OyENtQr6
         5FDynTTUCoMzzeNw0SphXpiBjgkgbH2+CUiLs1nKU65PvY4EJWSHQtrDJvBU0snwlfvb
         fyX+38Bw7Jc0q2n915JfiXAZAJPpxoiw0FYBM6RmkPb4b9qgtTo6idzFv19zU3aHx6br
         gDVlXlPlB9Nu987DIO3NnokWTfpk7fCHSAHtcbwjYbjus4ehZ9ZDGYuOpr5ov9zxv+WL
         SUpOBu16V0ZPJGFf5SImVTobN9i+uLHVB3jeA6sVtI0IlPYR6unTs22OdmYgImniFGCv
         i55Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLjTmIizAbg850Z/Ey6QxP/wiyhtw+MW/uYxnmyZM0b3jcvIQCJGGMYgS1eNZYFNDg4ZpB0uyCGqf4Bb3s@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8apCrGbtKfJVzK8QOni323DTLjE/NoKC2mE87gXqr/BI2Yu4J
	E+x5BWdtjpqHTR1AH58cPR6p81Ok+OnHtKLYIylugvPIATd9CuLa5j6/+gFAiph9ByZEEkJUwvI
	qfEcH9Plb0roYzX4uANPq/jREKpn0Eu+VnpL2+5xeIuStDMfyLDkKAEn5oUpOZq8WB+V8
X-Gm-Gg: AZuq6aIiO93U+ADhY0nJJl5LL7J5rBNwWJYS0VtCbj8mjsV2hfvmtRGFYDgY4Lh6RoO
	Ko78fHTLyDgWoOI+OBj9dE4rcUNT8lObJc3NMdHbvy0KLZpYuFmg52tbnwPmopEXrYifdF21PCC
	ODl62l4ngGO9eWtvUDLz4z4E4uiLri2vvtNMYEt381GsYp3xoifv5P/Ma9x1CRpELj/Z5W9mIDW
	eqwPN4z48Y4uJChav3TkqZfYmSBff2aFGPhXYH4RI8G72w+muf3o7d8Mn1G7LtzHlsNaVGLGWxr
	Uf2cRX6ps92aMM/AC0eYXy5dsaAfNH8gHtI6c5flQsJamI7NDvowVIGAFx/jYZwoc1/lvkprK4t
	7WyW5JDSP+XOChkkWfyllh05EUHzMmMq3Ef7WH4/sPDgChtaPAQBxoONoNg+TtlU=
X-Received: by 2002:a05:7300:8b24:b0:2b7:1e86:35ee with SMTP id 5a478bee46e88-2b7c88dd706mr4544945eec.28.1769999639083;
        Sun, 01 Feb 2026 18:33:59 -0800 (PST)
X-Received: by 2002:a05:7300:8b24:b0:2b7:1e86:35ee with SMTP id 5a478bee46e88-2b7c88dd706mr4544928eec.28.1769999638547;
        Sun, 01 Feb 2026 18:33:58 -0800 (PST)
Received: from [10.110.23.229] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfa53sm19489212eec.1.2026.02.01.18.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 18:33:58 -0800 (PST)
Message-ID: <800555e0-47ca-4d2f-8193-aeef76cdfcec@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 10:33:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
 <ca86ca83-1951-433a-9903-a95dd4be23b0@oss.qualcomm.com>
 <cx3yjz2nrwe6iwqorx537qzoz4qc3yefpln5ed7z3ocgeqlwq3@arj7auyyfutl>
Content-Language: en-US
In-Reply-To: <cx3yjz2nrwe6iwqorx537qzoz4qc3yefpln5ed7z3ocgeqlwq3@arj7auyyfutl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAyMCBTYWx0ZWRfX5q3UWiJAQd/V
 gT87kjQOy1i8qHYI7E6y1cHQVToW6QNze/2zp1YG7/an/6CWJUaWB/tWFt7NV7zku36nVMBksm9
 fWtdY80PKc9wwKq9gllH90bJDM1/x96K6lqy7KLpqOn6G+PawXD3JIsonf9ueFLrnqwIWV7W0DG
 D7RCTWfWvRtKPn46vQm3gLEu9jJNlTYdDSkCFLNs9BxvkXz5N0w9pSBnWIR0BnT+Av8c/4wf0OJ
 bEBJfg6FeVg9RD9Ii/RtNHzW+f/uZ0ZIVTPC2oeQcOQEnzR0/QsbkBgWB5RdCqWgiUsellEOp3T
 XHqQAn/lYpU/aBlC0vKerTvdDgD+tiseI1BD5k7tZhVQYKxA4wpCpD06n3lWsXR9ql49q+ax8IK
 HRHCnn02ZCTYvJKAtH+pj9z1Aut5+MQP95epCCVYA9Zux+4ghG+zviGCByNm7h9ZAb+heBBvWVb
 zWY3Dt1iqTS66DUO0ug==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=69800d18 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fkBO8gU33Nw6SBaqPCgA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 1-5JPMEKdhiJdEZSrQAwiWfG0AKzgWC9
X-Proofpoint-GUID: 1-5JPMEKdhiJdEZSrQAwiWfG0AKzgWC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020020
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-91405-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89834C7E38
X-Rspamd-Action: no action

Hi,

On 1/30/2026 10:31 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 11:17:49AM +0800, Mengshi Wu wrote:
>> Hi, 
>>
>> On 1/27/2026 11:06 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
>>>>
>>>>
>>>> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
>>>>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
>>>>>> data structures to enable Hands-Free Profile (HFP) hardware
>>>>>> offload support on these Qualcomm Bluetooth chipsets.
>>>>>>
>>>>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/bluetooth/hci_qca.c | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>
>>>>> Any other chips which would benefit from this flag? If you are setting
>>>>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
>>>>> set for WCN6750?
>>>>>
>>>>
>>>> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
>>>> considered at this time.
>>>
>>> What does it mean? It either supports HFP ofload, or not. Does it?
>>>
>>
>> We have not yet enabled the WCN6750 hardware offload feature from the
>> software side. Other chips will support this feature subsequently. If
>> I add the flag too early, it may be kind of misleading since the feature
>> is not really ready yet.
> 
> By the software side do you mean BT firmware or something else?
> 
Yes, firmware. And we will update firmware later to support this feature.


