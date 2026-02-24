Return-Path: <linux-arm-msm+bounces-93885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOKwA7o1nWlINQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:23:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B0A181DE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2158030EC57F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6F91DF273;
	Tue, 24 Feb 2026 05:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiGeUp4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0mIOoiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B822DFB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910479; cv=none; b=imjFj4gJHltypJo7B34QHKSNhStsrssU9l20PpTo6i3S/6IHD6AMRu5w+If7B0IkGNQ6OlQYt2COZ++qr9/nj0jDHiNXjA0T8aT9aS3aRhCHwi/HtkShfwCQbAy0nVfU+ARO2Rr9hNVBurMLZbXmztzh0NjnYEIEfBwkBqQ08Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910479; c=relaxed/simple;
	bh=nUZBF02KmJhFyymkXuV4+FAWr0DdIov3/U340uqJ1E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lueie9/73nF6d2wC/aG1agAfXykuxfADwlpMcmZbXrlQEc/Dunj4N5SL5hB3uC/Bat97gsb4iX4QJGdArwFAqpmZvDw1j9BprUroy5D7JA2zp0m9kMtkqnYCGw1MuJwznPrcGF9BOgFZ3ybbz/f2O9VspnXsicTIIQPdWKAwhzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiGeUp4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0mIOoiw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LQSj1017977
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3txuPy4prEUuoyyH0QQ6NjioZfBD6c6AvHOjoJ+brs=; b=SiGeUp4LdhaGNicQ
	dFgKspN2VqgCLfZHEJ+TEpdkyIeAUrIYwNRM5Y5YIBpKj1IMthQGj8qzAGjcpzE9
	AATuIRFWiBmO3X82sAKt17Rkw7g+P0BwE0bauTzq4jceOXzF9tb3lBMRotncTwwy
	WZPYPPWRYnsC1lcU+7UH2+Yc3+al1yfEFsMobhkMkE7tUUQA+xs7ldNzeJDU823R
	RZCQKSaS30DwFLEfQSeH7cfYaF8PKw3Dbp3+NjfFb54NkJ0wz5/dZoylLIMd/MGa
	A/uYeGVp5SjbPgZjlDSeRWixJemP99PfcO6ifPSkdaWBOjXrZEvIsZY9qHFw/+ax
	mnR9kQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8aqts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:21:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824a02e4d29so2176500b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 21:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771910476; x=1772515276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3txuPy4prEUuoyyH0QQ6NjioZfBD6c6AvHOjoJ+brs=;
        b=e0mIOoiwkTYB/oG19dzf+/MJryyKg/mvM/PxO+VIORWqWtsz3X+63CYzmdcJ+Ymi19
         R4C9HMSCQxlHyHrVT8Q+fyfgVDLjUR7UZhgdI1fCHj/2aRAlcPrWKmpCt9XHge7OD439
         0wwsupaWYoWFGPA/Dwi4cRu9ZtiK/DofJlGDEzCMMeisdtiiTA1MfbQ7gbBKSmgtpqjv
         Nu3OZR1C8fBIikLUCej2GD1rQ/17Qno3mdNMJ4opkCP+KqtBKjaup5eh+U9m3ZLSKJHX
         xlVwGKE4wG5Ti24gNFiO8m4GwurUkXjB46+niPYIR4h/LGt0TLMF7I1jjZVbzfU40cwc
         2YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910476; x=1772515276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3txuPy4prEUuoyyH0QQ6NjioZfBD6c6AvHOjoJ+brs=;
        b=GRliQF7Br3+wjlR/kQjKQqtJyJezrDwwB3tr6oMobFDdegJKWzezy8IjXSBU3nrIDX
         w9OrhLZtz2k2ZBwjsU+YCMLkTiEcZOtEOqQYbmtu0UksL67cogUEY71k/TPN2qt0CFYZ
         SO/XxTSWR5agozVbwHREZu0faCa2114oV8+Mm7Linr9XJzuZ4qg/6im+HnaLCuDL5p1C
         M1S3IuNaII7sw7DSUeUGMwFIkhU52BZ+b5WRtPSt9uPLOAFpZ6yHGInY7JtU8utsAWMy
         5V3tl0KonDhEHPjZOPCMVoRK6YaiciyAk7TPBQilADLW2Udqz++WGLGYdJQ8ilsTOWjK
         akIg==
X-Forwarded-Encrypted: i=1; AJvYcCWDjRzXlFcnGBMiQaJhSTfHb/rTGc9RNjpjB0jlpPty/9mcdV96y2xOMecrzQjl4zclringr7Yx7xvTrndJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOuK0ASiIth8u0mcxpJIyOaBEu7qmIL/xK5Sle05OMBqB00/p
	LL0TEZsVmh5tn8w7wxJXRtllb7pyb3nnwxj3/YwJ3iRDlZd4oU0i5ukLCHGa3dChduUuKUQjdl0
	+MpgBdPVrdp9clqmG8E4dmCxpKxyHxapEgTqHUMreWv8ZoUSFhwDd8M2N/j1xH+lDyJoZ
X-Gm-Gg: ATEYQzzAlvNs5Eq4hoOM/d6tyRTXJOS62LQ1EuNNnliwh9X4NM5WI8YR6ffChjYOnHt
	9HRLwFFUpUjNOVnW2OsT3z1sqnsno8gJP23eJufW0ou63vqOhyK+5cSJHQskB9dBFJhdoeJ+HSy
	ALRked5fWZINNnt7aLgdADT1LezrI2R3quBAVsy4sP+6eRrq8fF+wust63EmDFZ2CEwfRjYHj+q
	4R39Xjc+nEXRSV0dwhuaD1xwhByWPh96e5TGvJ184K2ynbk5gUrZd5eSGw6Mr8N3IHwj9b8zWMp
	+6q8xPe2FZwaT1RwaqfXW5w6qmFn0fAvmNmZQ0WW9s7QBUcjI7fVvdmWN6frZS/Eu3eanfU5j6T
	pImvu4zd1TXb3Hp4ndNWlYaYW8ythOalcI4UiVCOd5XSbnge5XKB9tg==
X-Received: by 2002:a05:6a00:1150:b0:824:374a:1404 with SMTP id d2e1a72fcca58-826daa9425bmr10111817b3a.46.1771910476005;
        Mon, 23 Feb 2026 21:21:16 -0800 (PST)
X-Received: by 2002:a05:6a00:1150:b0:824:374a:1404 with SMTP id d2e1a72fcca58-826daa9425bmr10111794b3a.46.1771910475526;
        Mon, 23 Feb 2026 21:21:15 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8cbb02sm9512889b3a.57.2026.02.23.21.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:21:15 -0800 (PST)
Message-ID: <e5296567-db3a-48d1-b40b-2791ccf5d911@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 10:51:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com
References: <20260223152901.GA3694918@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260223152901.GA3694918@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0MyBTYWx0ZWRfXwAY4oHQs7udD
 2CJd5o4NeLhD07YxWNE1YWxRxJq8d3Gzx73cQCHiQDY4o/GXeBfrvBk25lT4crG3z07IyEjetyK
 Q+H6Z5KcvnV3YdYX6kci6BMc9jqwEQC1T7HiiduPGwz5/GNtYLs3mjCp47JsSvULHn1DOVBRNTZ
 KMsDR1amy2bnMbIccYUDfvdFCrTK5nc1EuOo4z/EaK/5FuyuWLi8039qMetJausT84s2PIYWbdo
 bYEbiiCBwVsBDFQDxEUIN1grp3KT2EHHbKhQ5tqEDt1hwffetmmn1EAlW31o4RxDxryEQvbU6LC
 Q2OtEGX/4lsAqZRvzSJLNeEjihJepmNSbeMjVr1mClAEXBekPQ+oT4SJ7BUwEY77xebpuRdmW7o
 UYSGgAUPGdOeMAYUDJNdgPcuswlb27/GPPoh0EUMDwzyOEgYuknZk2Cgo9CzuqF4UAHQs/ff/pJ
 HRsBzIgP2iYQFSfA70Q==
X-Proofpoint-GUID: Gcg0QP5GSFZO2DTDjJCUfRpdZNTzs09Q
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d354d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kJBpcOZ6olZWUerAqwAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Gcg0QP5GSFZO2DTDjJCUfRpdZNTzs09Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64B0A181DE5
X-Rspamd-Action: no action



On 2/23/2026 8:59 PM, Bjorn Helgaas wrote:
> On Mon, Feb 23, 2026 at 04:43:30PM +0530, Krishna Chaitanya Chundru wrote:
>> Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
>> parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.
>>
>> This helper can be used by the controller drivers to change the
>> default/wrong value of T_POWER_ON in L1ss capability register to
>> avoid incorrect calculation of LTR_L1.2_THRESHOLD value.
>>
>> The helper converts a T_POWER_ON time specified in microseconds into
>> the appropriate scale/value encoding defined by the PCIe spec r7.0,
>> sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
>> to the largest representable encoding.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/pci.h     |  2 ++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
>> + * @t_power_on_us: T_POWER_ON time in microseconds
>> + * @scale: Encoded T_POWER_ON_Scale (0..2)
>> + * @value: Encoded T_POWER_ON_Value
>> + *
>> + * T_POWER_ON is encoded as:
>> + *   T_POWER_ON(us) = scale_unit(us) * value
>> + *
>> + * where scale_unit is selected by @scale:
>> + *   0: 2us
>> + *   1: 10us
>> + *   2: 100us
>> + *
>> + * If @t_power_on_us exceeds the maximum representable value, the result
>> + * is clamped to the largest encodable T_POWER_ON.
>> + *
>> + * See PCIe r7.0, sec 7.8.3.2.
>> + */
>> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
>> +{
>> +	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);
>> +
>> +	/*
>> +	 * T_POWER_ON_Value ("value") is a 5-bit field with max
>> +	 * value of 31.
>> +	 */
>> +	if (t_power_on_us <= 2 * maxv) {
>> +		*scale = 0; /* Value times 2us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 2);
>> +	} else if (t_power_on_us <= 10 * maxv) {
>> +		*scale = 1; /* Value times 10us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 10);
>> +	} else if (t_power_on_us <= 100 * maxv) {
>> +		*scale = 2; /* value times 100us */
>> +		*value = DIV_ROUND_UP(t_power_on_us, 100);
>> +	} else {
>> +		*scale = 2;
>> +		*value = maxv;
>> +	}
>> +}
>> +EXPORT_SYMBOL(pcie_encode_t_power_on);
>> +
>>   /*
>>    * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
>>    * register.  Ports enter L1.2 when the most recent LTR value is greater
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..eec16fdcb9996ab0f663f4587a2367a676a49ce6 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -1911,6 +1911,7 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>>   void pcie_no_aspm(void);
>>   bool pcie_aspm_support_enabled(void);
>>   bool pcie_aspm_enabled(struct pci_dev *pdev);
>> +void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
> This looks like it should go in drivers/pci/pci.h.  I don't think it's
> needed outside drivers/pci/.
ack, I will fix in next patch.

- Krishna Chaitanya.
>>   #else
>>   static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
>>   { return 0; }
>> @@ -1923,6 +1924,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>>   static inline void pcie_no_aspm(void) { }
>>   static inline bool pcie_aspm_support_enabled(void) { return false; }
>>   static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
>> +static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
>>   #endif
>>   
>>   #ifdef CONFIG_HOTPLUG_PCI
>>
>> -- 
>> 2.34.1
>>


