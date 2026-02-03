Return-Path: <linux-arm-msm+bounces-91658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Pa5AyHRgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:42:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAAD7E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D27531733A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914F431ED7D;
	Tue,  3 Feb 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcqD/P77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4jJFfzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B0347DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114701; cv=none; b=d2gtW6wD25Kc2ofIUgHcr0Eyg3JTPl8wGhSdz/Oj5b3G48tOizkXUT34wB1TQHVSUJYRImtsDfjcRuyUITqPmLt6vo/m4tjmpEHO0pjj0K/0/aXb+EglNI327OPJZ9cHEFrH7qxAv9NJFgt3lWBHqhFWXmM2JtdESi5eY5pqZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114701; c=relaxed/simple;
	bh=jqacXxFlc1I7eXb0zh31ZZrWOqUTWvVAs39r125CB40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOwddFPJiRkI0tmmUXqnuIPjnkHs7eVxZq3c1PzArkpJ2CBs7dAhPWthS/89Dki3ZvOcbnt2N20f+6ulARlRJXWyzsmGXssn8RFejvcAvfemHwNsF4x78E1blywwpDH1PdUkPp8Kw1/uPxDzBn77k00nKX6G/NSo5j8o13hzEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcqD/P77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4jJFfzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136fCPF278229
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnFkLFG/8GR6ETCgAYZh5+yfUeLLoqMFnRTgAzekePc=; b=FcqD/P77wOY9BjSm
	6sv1b1fq2LHOa77VdX1S0OROsZUACF4XFrVP2g+YP3ufa9CbSTSg9g8+JoWWosz3
	hEe4V/FoozP3Zsbf2WjUe0Zj+xKTJIEzVjYGYy6rjzjsdS/EH0tvICD8jI8ESw5b
	E0H/SzaIzrtgfh2r2JW1pX6svhMYu+QY1bnZtpwiT3Znyx/DbcGujyKUkQG0F+iy
	Q7dF3SvMdJ0coZJZCiIqpXL7q1GETvFRVGnwEDI5AlsXO/QvwZ6LzjnIN8ttjV+n
	usC93gKZ6GnmAJMHSOaegH5z78htsh3fQ1AVx3TDCKzGs1HpIThBz+YP94cyAZ/9
	fQIIOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3a98x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:31:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so86399185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114698; x=1770719498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnFkLFG/8GR6ETCgAYZh5+yfUeLLoqMFnRTgAzekePc=;
        b=I4jJFfztP1xuqt3znICr02o5fTCkUqqswlmpv7hmGu/LUwmmhW/XcXjjN55QE/tD8I
         ueLEFN6Tm1HITDJEiw29QrB0ms0zHIWJ6iQg5cQKTEWKCOuL/War4ExHccUQkg7j3nY1
         zgWDQuc7BHsqTbhx/EBw5EeXI2U/O0mSxAr5bApXGuyOVvSaVcWv3nVRK9g9Rg/wEwIr
         N4TTLaBr/ZykZX4C7KryWVJE74OU3PEb80N8/R5H/zOtc47bpYq/33C4FU0ONwarnsMo
         3xip+22PuESB7/YXfbhA/xv67/SMQJx4+X+1tx5KgcANhUzWVA9eKt23NRNZzmMikB6q
         e2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114698; x=1770719498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnFkLFG/8GR6ETCgAYZh5+yfUeLLoqMFnRTgAzekePc=;
        b=U+NF2c0kvEiBt/bWqSVoSOhakAZ9LR7TMKptYaiXvdcwvWuI4WEeyXnce+8ZAaNbK7
         6GhM1c2qgPLI3yBtT4YcUs8hDPwfPuzL+bIOo+71DrtnImcA+1UBKpcwLf0IipD1UkSd
         HCgSnjhOYjXmRUQh+yjzcQfcEtEwb62jR4xSc/TFNArQvtm4ZEmT+qahcgYQEcNf4dGV
         WlQTirsCzXcGTkaEz1ilyNQ8c7m32fOkIhJiXgGw9aGw5FgnKDLVBUsSXR+JLzidBRm5
         0BlmyhmTOMqV7O5PNW/XmZ2SUeC364O0QgSRy6YDodGqZRbGUX+TRkiM3jVfVgyCqLqk
         ygYw==
X-Gm-Message-State: AOJu0YzPbuJTZNFy56RFNaxNIjPSJLBvt40TfvlFfA3/l/vbgaPSXMcM
	lHQM0+NTvFotb+skYq7UNZdJbv76ZAPkao0l6+gbS5Z6Al9Tpl0nI4y7ezYFHo7Uym26Fkx36X9
	nQnBfWq30/z51rSCmPf9SzOLJsPl5C4b5RabAEt0bDnvSg7ke59OPaVNGVWH98JcXgQkHStlSnC
	va
X-Gm-Gg: AZuq6aKbCHpnI37Mdfrbj60wlGppWumaRcT0w88XUm+OVQBZhTJyLfbJl+WXqgoDbf8
	DsjGDyuOJQIWZ7dODf9IzoRHmFP2lrNtMh6IMV2HVkbwfUS+jU2g9nOAWyV0cmPjwEynBlnheDL
	fuW4uj7HOmPuo7xk47f3Pk8B7ygf74UrIxwzQ9DR8TTdoiFqlhUiJBXj9Ch1etPO6pkXYm8MHqW
	LT3F5aysSEn9iPBgFMs0K2u8hF/VTPNp6q3lMNq7AWprnW9VIxxQqDo/dHs9f2Ly8updBZfSqKi
	YTV7nl06iRWTVA8e2UaccC6EuMQUnt8WBJMujoGKkDvH/EnpyZ3ApvI67pJ1uaqpQitBQwEnwSH
	5x1/ZWkIpoYn41WllQfyo882hp1pK1Iyyj9xx5zIf3DlK7CTQqftLDhQip+Qw8HJXzjY=
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1457269685a.4.1770114698365;
        Tue, 03 Feb 2026 02:31:38 -0800 (PST)
X-Received: by 2002:a05:620a:7011:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c9eb277e82mr1457268285a.4.1770114697933;
        Tue, 03 Feb 2026 02:31:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3d734aesm849478766b.7.2026.02.03.02.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:31:37 -0800 (PST)
Message-ID: <6dc6a2ea-e812-4966-af32-96cb776717b8@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:31:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com>
 <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
 <24f770ff-e4a6-4f8c-be72-26ff5cbf8d1a@oss.qualcomm.com>
 <CALHNRZ_79_SvsgeFu-n4txsRAcj5Tw+UOza12vZC0=isWA28Bw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_79_SvsgeFu-n4txsRAcj5Tw+UOza12vZC0=isWA28Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981ce8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E2KHuo4Xqxd5VruFSTEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xFe2lbCTb63lTQY7FWD6L_rHBcwDkSqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX6rELk4kt69YE
 AbAMtG3iPxkuGbw98FHpOf2GMTTN04XOK0ihNzDMR0ZVlxmFD7IPHsTZtcNCI2s0/167JMnH1N7
 b73FrWQFxXsTMhKajLEq2Ne8yw/4u9tevonRT7fLL9frf74hwrqll+u7gXyZgTxxVrIJyffx8aX
 AeKBK/yke1foo8PmVNWzpcConw+yMmJesOHs6sZ1W3c32tza5gmtyJCEoR/bTaFhSV0lbd1GqqQ
 KRoof/Gl5EvkZBybRYn9j6txPAkE6aIe6umFNsuoENSXMYz2oT3QghJzwOd8ED5jhPuE6nI6Ak4
 rqEMweokbbCI/zAnBIsYhGeRfgLd8NSY9906e1MYHUazlF+WpNQsOu8jcH3gV3fE3r9qJWzciQC
 GJpFyxA2AVb9FZ7yeuj82XcqTSmYo9XgL35Y1CyFJ6LowiIfcBXm12mPs/kw15gmWGU9nvBSyz4
 Tfy+qER9k1s8Ry1HXlg==
X-Proofpoint-GUID: xFe2lbCTb63lTQY7FWD6L_rHBcwDkSqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91658-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8BFAAD7E3F
X-Rspamd-Action: no action

On 2/3/26 12:12 AM, Aaron Kling wrote:
> On Mon, Feb 2, 2026 at 4:36 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 1/30/26 6:13 PM, Aaron Kling wrote:
>>> On Fri, Jan 30, 2026 at 5:01 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 1/27/26 11:48 PM, Aaron Kling wrote:
>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>>> for Android, using mainline kernel drivers. I have come across some
>>>>> missing functionality and failures that I would like to inquire about.
>>>>>
>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>>> and go to the bootloader menu. This appears to be an issue in the
>>>>> baseline abl code, affecting all devices of that generation. Would it
>>>>> be allowable to merge a change adding those changes to the sm8550
>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?

[...]

>> I'd consider building full DTBs for each device
> 
> My end goal makes that difficult. I'm working on LineageOS, an open
> source AOSP fork. I am attempting to make a single build target that
> supports all four AYN qcs8550 devices. Android puts the base dtb in
> vendor_boot. The concept supports multiple dtb's, but the ids the
> bootloader uses to fetch said dtb matches across all four devices.
> Even more unfortunately, this is true for the dtbo id as well; the
> vendor did not set unique board ids for the different devices.
> However, I can pull some tricks to use a variant dtbo image per
> device. That concept isn't feasible for the vendor_boot partition. So
> I'm taking every reasonable effort to support dtbo's.
> 
> And to be fair, beyond these node name and label requirements, I have
> not seen any breakage. Once the bootloader is convinced to actually
> apply the dtbo, it works as expected.

I see

It may be that I lost some context across various threads, but IIUC
we're down to just label changes, which I suppose are generally fine..
Am I following?

Konrad

