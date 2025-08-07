Return-Path: <linux-arm-msm+bounces-67966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A2B1D302
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 09:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573C43AB64C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD1122FDE8;
	Thu,  7 Aug 2025 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwcUBmyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023B21CA1C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550574; cv=none; b=PEwNWt82lkRaEh3/LxmAwarQpYiDQSXl3MxIsvFVjOQ51VnY2Ttl1pc5Yl2SO/39YfEoOiF1ue2qGA4jFKgs1IPx26XIKuwuC24b6CySXWTXoO/imUqn9vtw9TCnLIqq8bCM98Mpb6zpOC5irDr0HTOOJThpdktPtsACZSx59r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550574; c=relaxed/simple;
	bh=xr+ppKt+cddcjWsXhfIDZtODVhgjspa4N6oSE4eElME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEud3irzR4yHoqV/AdDBdDV35x9vNCqFQushtpTHPS2PwkiNrrpt283wHl8aCPzNz141pTb9QlkHCD3/xJK7TpjnATd6hSNgPFxJ2oAFR+8d0EfekswgaWIeP7Cdga0H6rOLSip42XVnGoHwOzHnd9tcT953gb4hEcYwZwSeudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwcUBmyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576N7DoC025041
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 07:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEwGLYz8XiSmNdsJNXaQOuwAlw/NiAcoCG+ATk029nw=; b=gwcUBmyJClxJfCPz
	tLTTztNh1IbtGl+2NYSSrXvtC8PGxYbT3pOj5UulzXf3M1YTOTGY/ZL1vqowUNs8
	YnUSEmczySvZYJihLQBTnTcPcIXP29PJyIdajOiwuNRgM5ImnCoko0puw/ZaEiQA
	mpnTvSppG5zdR0IhrPZQ4vaplTYs8tecNZ7sYrYeUt2zmHkeaHpKVGQeaFGv91/p
	jOuFmQTl7zxXzDu+ZbB55Q4AHXhRqyL3Wt6xPenT2btkQdmqs4GEnqQy7f4PKjV0
	87F81+vlQSlKr1mRQOqACA3q4m79D5+kZGAivVz9hQSGvukMyyNJ35vVgWFlUhPr
	fBvBtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvywk6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 07:09:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso552765a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 00:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550571; x=1755155371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEwGLYz8XiSmNdsJNXaQOuwAlw/NiAcoCG+ATk029nw=;
        b=koMyj/rbljN1EN+xJ/Hsk/28kcQN1SbhlcuGWLiq1ktk/5pGIuoKp9jfgh7NPkLKFU
         23EK7+6F7XQg5KWostBL3marh4V8AuRKFFHYAFzYOT59b/sQTrubiTH2FmCEn5zSeJmB
         4LmI3jpe+zFNTQQdIedu012f6xwnmT+8zKzCvw/62DMJj6AlBcM7jcpGGInmlZORRKvB
         dJ3s7Z+0lgJOGHlRzUSiMXBoFrqmt/mYF4y0F6eWY1K9iTNz0aR97Yg67RDrDhk+8Yzq
         crzS6FmnL7skt/9V1mjvcmo0rT4qtjYDpIpqkqPSi9JJOwm/dQrqXyA8Yhuv8/AFaKA2
         RjKw==
X-Forwarded-Encrypted: i=1; AJvYcCU2d1dxoguwDDr73LZdNwryrN6BSD5IRKRgruGWzAOyxFzrqBBquMx8tkgyT6/+LXREclNqu/jXqgyOSZyO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+RqsL6CBNntv1sN5YmVidIIbjVyL6Ueoohv3WzmgTB1dp8Fz
	C9LaOaB3HwMAja6NUKpQiI/zSqnWMfr6/zvZrB3MqEpfM9hdWydeuC7PYP2ArnrRBkYuJhv4flP
	YnbNv9KNrn6ZFDVXjGXlFWFhvndQXujCvxbe4emTEndFWl1a8hrQjlxTXeYGgo3tT63KX
X-Gm-Gg: ASbGncuN0EUp+AONjbVSyWGep6PW7cUcLGfR3ofPHqWfMGOqXC+CFsOpQ16TIpKkqz9
	tCNilvKJeOrZK3shilQnfHdoWCCT7tkNAa/mejYNsBLUlHx/gep8bMD3nt5a0YO2aKpObTgJFJ0
	wVXkiU462HMtBylTpnba/KOPlrFK7SonySKQ7pyYvEkm9I8jjBA+m5PiEdkrL4QCNgj5UiILpJA
	HQqR9DQdAiJ+ny9XjVMMMHRNrORjsW5TshsGIpg91jc7ykdYzxe2jM2/taOfJFUs2o1NiGMvm5N
	EfuQQsfvKwwup53YWbnVus2jNEwQ9JBdkIDvvOyqAmDcAikqs3ADuke6J7aR8BUr3vIzCEeUQQ=
	=
X-Received: by 2002:a17:903:2a87:b0:23f:f39b:eaf6 with SMTP id d9443c01a7336-2429f43b579mr90060955ad.46.1754550571138;
        Thu, 07 Aug 2025 00:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe3aRe1qG0DJXY2XfpX7tFnk8ifcRKx5s/G5Woq0MqAtS7oEMEjvhrtCOshWW5KX9VFzq6ZA==
X-Received: by 2002:a17:903:2a87:b0:23f:f39b:eaf6 with SMTP id d9443c01a7336-2429f43b579mr90060715ad.46.1754550570723;
        Thu, 07 Aug 2025 00:09:30 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm161651555ad.63.2025.08.07.00.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:09:30 -0700 (PDT)
Message-ID: <1c79cda0-2645-4f88-a05f-9082e305fad4@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 12:39:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Manivannan Sadhasivam <mani@kernel.org>, Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
 <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BdccIeOIrvikvchxLUTNiTgQdoZ91nJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/34mg+sJ1RR5
 eSjqm6UThrt8y4jTErEmokByXlgwJhj66TDLVjovLrcmKUy8T86P20ynjD3Jioyq71+J34ia/Pr
 siukhUW0DISYujoSAS30p0OM7KqkGB3QLxtOQqtiHDvmSOJpE7UVD/0UuGMGrAee8MvDcZkTF6l
 f7McA2Kzcny0Fx/1cuAr4LM4+FedyPZpS4SY0pjGEZDshLcQWtuKsc6XCFfuCrWnyATUs3PCJRI
 y5lqwqNZq2v0b/ww2yxLwj1GeYQPU74zus5qArO62WTggdsFXNxf8jffP69jn4qASfARGAR1+Fg
 tMyY4aIFWZQ8otIPgb1tV4fN20B8rDQVlpDFX0rUiLkzX9xUnO1iMVxPKPY77W7WpHaZAJ07lSw
 1TdUyZRb
X-Proofpoint-ORIG-GUID: BdccIeOIrvikvchxLUTNiTgQdoZ91nJd
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6894512c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=21QzX6uEHMqXofhgfOUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/6/2025 10:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 10, 2025 at 02:28:33PM GMT, Vivek.Pernamitta@quicinc.com wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
>> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
>> SUBSYSTEM_VENDOR_ID to check if the device is active.
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>   	u16 vendor = 0;
>>   
>> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>> -		return false;
>> +	if (pdev->is_virtfn)
>> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
>> +	else
>> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
> 
> You should not read the sub Vendor ID for VF. PCIe spec suggests reading the PF
> Vendor ID for VF. So you should just use pci_physfn() API as below:
> 
> 	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);
> 
> This will work for both PF and VF.
> 
This will defeat the purpose of having health check monitor for VF,
as we are always reading PF vendor ID and will not know VF status at all.

- Krishna Chaitanya.
> - Mani
> 

