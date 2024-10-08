Return-Path: <linux-arm-msm+bounces-33548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5D9948CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B765285175
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5FB1DEFFC;
	Tue,  8 Oct 2024 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fv23Ahf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0061DEFED;
	Tue,  8 Oct 2024 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389794; cv=none; b=UMthCF44aNoKZTHCZ5ri4JCt3Ei8enolu9wBj7AnpWyLNoEurT28s9dD8YrQ22+43zEAfHuVT/r12oCKISt2mOMV7rQlUU/7+YmJISWaN8WkH4VSdn6f3o5nIytrexB8KMw6PqYecbQAMyIxHt1XwB74yUwtJrLuUjy56WbuPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389794; c=relaxed/simple;
	bh=F+VjZb+GReXC3w7gI02+LUPfUUcYspBK7uTsXjzi/rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KqTkvochyhcBqh45ZrdR3+FIShSOsu8UOG8pk0Vuw2sv2LD7AWSm0O7ob/HBx31LsSYGLfmjofHGjAem37O989sI86nAeY3E48WBpsAgt+k7vbM6dKF6liSQr850/pTguV3q5Ln+dpERw7rCSkv00lXLj/ykvTqG5FAq1v6tM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fv23Ahf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989U4lx004219;
	Tue, 8 Oct 2024 12:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMwytKd96lY8DysyqJmWlSywdWT7QkTsj0FkIVOmKK8=; b=fv23Ahf7qLNGm1P0
	Kq2Kv4gzeV2wy2Aab8cueGz3upVouIz2vvLPmz09+alXO+eajhx35UXI0nJdu3/E
	8KvNps4GlAegZm73CJDLfwrnarUlXfyfxvjVtkJJBp6Ej0RxhFB9mg79DPC2NC3B
	rCb119YCRbSlguZf5RDRPMFseRYTKtDPoi/K+J407TMO/BIPMKfppf1+mXiN1gU/
	HK12NqJjeAnWWdSW8wnEHY5r4oPDpuhhSTjaTMc6LJpXHM+vf7sMFVrqRBGNv0L/
	2qRocuCPZQYFQ44U4FYzXUHx3KeL45OSYgyPvndr4OO4GCNhmWNSaE2IriSTzmt2
	nNapbQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9ycb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:16:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498CG9bW030217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 12:16:09 GMT
Received: from [10.50.59.162] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 05:15:58 -0700
Message-ID: <83872fec-4085-41db-9460-1c116afc52d6@quicinc.com>
Date: Tue, 8 Oct 2024 17:45:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
To: Andrew Halaney <ahalaney@redhat.com>
CC: Suraj Jaiswal <jsuraj@qti.qualcomm.com>,
        "Suraj Jaiswal (QUIC)"
	<quic_jsuraj@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>, Rob Herring <robh@kernel.org>,
        kernel
	<kernel@quicinc.com>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788F524C9A5B3471871E055E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
 <ypfbzhjyqqwwzciifkwvhimrolg6haiysqmxamkhnryez4npxx@l4blfw43sxgt>
 <05909d17-0111-4080-97cc-82ed435728a7@quicinc.com>
 <gbia6rqppcc53vmel5q5jvgdri3cmeowb64mxfk7jzo6ncuz2f@6kd7acqii62x>
Content-Language: en-US
From: Sarosh Hasan <quic_sarohasa@quicinc.com>
In-Reply-To: <gbia6rqppcc53vmel5q5jvgdri3cmeowb64mxfk7jzo6ncuz2f@6kd7acqii62x>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v-q7ww8Pg7WMeLoEVScA3soI5QpuJc-8
X-Proofpoint-GUID: v-q7ww8Pg7WMeLoEVScA3soI5QpuJc-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080077



On 9/24/2024 10:06 PM, Andrew Halaney wrote:
> On Tue, Sep 24, 2024 at 04:36:59PM GMT, Sarosh Hasan wrote:
>>
>>
>> On 9/10/2024 7:34 PM, Andrew Halaney wrote:
>>> Hey Suraj,
>>>
>>> Your email client didn't seem to quote my response in your latest reply,
>>> so its difficult to figure out what you're writing vs me below. It also
>>> seems to have messed with the line breaks so I'm manually redoing those.
>>>
>>> Please see if you can figure out how to make that happen for further
>>> replies!
>>>
>>> More comments below...
>>>
>>> On Tue, Sep 10, 2024 at 12:47:08PM GMT, Suraj Jaiswal wrote:
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: Andrew Halaney <ahalaney@redhat.com> 
>>>> Sent: Wednesday, September 4, 2024 3:47 AM
>>>> To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
>>>> Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <agross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <konrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <robh@kernel.org>; kernel <kernel@quicinc.com>
>>>> Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for multiple descriptors
>>>>
>>>> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
>>>>
>>>> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
>>>>> Currently same page address is shared
>>>>> between multiple buffer addresses and causing smmu fault for other 
>>>>> descriptor if address hold by one descriptor got cleaned.
>>>>> Allocate separate buffer address for each descriptor for TSO path so 
>>>>> that if one descriptor cleared it should not clean other descriptor 
>>>>> address.
>>>
>>> snip...
>>>
>>>>>
>>>>>  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int 
>>>>> queue) @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>>>>>               pay_len = 0;
>>>>>       }
>>>>>
>>>>> -     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
>>>>> +     if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
>>>>> +                              tmp_pay_len, nfrags == 0, queue, false))
>>>>> +             goto dma_map_err;
>>>>
>>>> Changing the second argument here is subtly changing the dma_cap.addr64 <= 32
>>>> case right before this. Is that intentional?
>>>>
>>>> i.e., prior, pretend des = 0 (side note but des is a very confusing variable
>>>> name for "dma address" when there's also mentions of desc meaning "descriptor"
>>>> in the DMA ring). In the <= 32 case, we'd call stmmac_tso_allocator(priv, 0)
>>>> and in the else case we'd call stmmac_tso_allocator(priv, 0 + proto_hdr_len).
>>>>
>>>> With this change in both cases its called with the (not-yet-dma-mapped)
>>>> skb->data + proto_hdr_len always (i.e. like the else case).
>>>>
>>>> Honestly, the <= 32 case reads weird to me without this patch. It seems some
>>>> of the buffer is filled but des is not properly incremented?
>>>>
>>>> I don't know how this hardware is supposed to be programmed (no databook
>>>> access) but that seems fishy (and like a separate bug, which would be nice to
>>>> squash if so in its own patch). Would you be able to explain the logic there
>>>> to me if it does make sense to you?
>>>>
>>>
>>>> <Suraj> des can not be 0 . des 0 means dma_map_single() failed and it will return.
>>>> If we see if des calculation (first->des1 = cpu_to_le32(des + proto_hdr_len);)
>>>> and else case des calculator ( des += proto_hdr_len;) it is adding proto_hdr_len
>>>> to the memory that we after mapping skb->data using dma_map_single.
>>>> Same way we added proto_hdr_len in second argument . 
>>>
>>>
>>> 0 was just an example, and a confusing one, sorry. Let me paste the original
>>> fishy code that I think you've modified the behavior for. Here's the
>>> original:
>>>
>>> 	if (priv->dma_cap.addr64 <= 32) {
>>> 		first->des0 = cpu_to_le32(des);
>>>
>>> 		/* Fill start of payload in buff2 of first descriptor */
>>> 		if (pay_len)
>>> 			first->des1 = cpu_to_le32(des + proto_hdr_len);
>>>
>>> 		/* If needed take extra descriptors to fill the remaining payload */
>>> 		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
>>> 	} else {
>>> 		stmmac_set_desc_addr(priv, first, des);
>>> 		tmp_pay_len = pay_len;
>>> 		des += proto_hdr_len;
>>> 		pay_len = 0;
>>> 	}
>>>
>>> 	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
>>>
>>> Imagine the <= 32 case. Let's say des is address 0 (just for simplicity
>>> sake, let's assume that's valid). That means:
>>>
>>>     first->des0 = des;
>>>     first->des1 = des + proto_hdr_len;
>>>     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue)
>>>
>>>     if des is 0, proto_hdr_len is 64, then that means
>>>
>>>     first->des0 = 0
>>>     first->des1 = 64
>>>     stmmac_tso_allocator(priv, 0, tmp_pay_len, (nfrags == 0), queue)
>>>
>>> That seems fishy to me. We setup up the first descriptor with the
>>> beginning of des, and then the code goes and sets up more descriptors
>>> (stmmac_tso_allocator()) starting with the same des again?
>> tso_alloc is checking if more descriptor needed for packet . it is adding offset to get next
>> descriptor (curr_addr = des + (total_len - tmp_len)) and storing in des of next descriptor.
> 
> Yes, so in stmmac_tso_allocator() we currently have:
> 
> 	static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
> 					 int total_len, bool last_segment, u32 queue)
> 	{
> 		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
> 		struct dma_desc *desc;
> 		u32 buff_size;
> 		int tmp_len;
> 
> 		tmp_len = total_len;
> 
> 		while (tmp_len > 0) {
> 			dma_addr_t curr_addr;
> 
> 			tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx,
> 							priv->dma_conf.dma_tx_size);
> 			...
> 			curr_addr = des + (total_len - tmp_len);
> 			if (priv->dma_cap.addr64 <= 32)
> 				desc->des0 = cpu_to_le32(curr_addr);
> 
> so on the first loop you've got:
> 	tmp_len = total_len
> 	...
> 	curr_addr = des + total_len - temp_len
> 	i.e.
> 	curr_addr = des
> meaning with the "first" handling I've highlighted we've got
> 	first->des0 = des
> 	"next"->des0 = des
> 
> where "next" is the cur_tx descriptor in the first loop of
> stmmac_tso_allocator() (essentially the second descriptor).
> That seems broken to me, and was that way prior to this patch.
> 
able to verify for DMA mask < 32 and > 32 . We will update final patch by taking cares of others commnet
> You've modified the behavior in this patch unintentionally. I think it
> needs modifying, but it should be done so explicitly in its own patch
> prior to this one. I also think the current modification in this patch
> isn't a fix. See prior reply below where I highlighted the programming as I
> understand it with this patch applied, which would result in something
> like.
> 
> first->des0 = des
> first->des1 = des + proto_hdr_len
> "next"->des0 = des + proto_hdr_len
> 
> Which again seems wrong, two descriptors pointing to the same address
> isn't making sense to me.
> 
> Sorry to sound like a broken record, but I want to make sure we're on
> the same page! Sounds like you're looking into it based on the below
> comment, but some of these comments here made me think I didn't explain
> the situation well enough.
> 
>>>
>>> Should we be adding the payload length (TSO_MAX_BUFF_SIZE I suppose
>>> based on the tmp_pay_len = pay_len - TSO_MAX_BUFFSIZE above)? It seems
>>> that <= 32 results in duplicate data in both the "first" descriptor
>>> programmed above, and in the "second" descriptor programmed in
>>> stmmac_tso_allocator().
>> curr_addr = des + (total_len - tmp_len) is used in while loop in  tso_alloc to get address of all required descriptor . 
>> descriptor address will be updated finally in tso_alloc by below call .
>>  
>> if (priv->dma_cap.addr64 <= 32)
>>                                                desc->des0 = cpu_to_le32(curr_addr);
>>                                else
>>                                                stmmac_set_desc_addr(priv, desc, curr_addr);
>>
>>  Also, since tmp_pay_len is decremented, but des
>>> isn't, it seems that stmmac_tso_allocator() would not put all of the
>>> buffer in the descriptors and would leave the last TSO_MAX_BUFF_SIZE
>>> bytes out?
>>>
>>> I highlight all of this because with your change here we get the
>>> following now in the <= 32 case:
>>>
>>>     first->des0 = des
>>>     first->des1 = des + proto_hdr_len
>>>     stmmac_tso_allocator(priv, des + proto_hdr_len, ...)
>>>
>>> which is a subtle change in the call to stmmac_tso_allocator, meaning
>>> a subtle change in the descriptor programming.
>>>
>>> Both seem wrong for the <= 32 case, but I'm "reading between the lines"
>>> with how these descriptors are programmed (I don't have the docs to back
>>> this up, I'm inferring from the code). It seems to me that in the <= 32
>>> case we should have:
>>>
>>>     first->des0 = des
>>>     first->des1 = des + proto_hdr_len
>>>     stmmac_tso_allocator(priv, des + TSO_MAX_BUF_SIZE, ...)
>>
>> let me check <=32 case only on setup and get back.
>>>
>>> or similar depending on if that really makes sense with how des0/des1 is
>>> used (the handling is different in stmmac_tso_allocator() for <= 32,
>>> only des0 is used so I'm having a tough time figuring out how much of
>>> the des is actually programmed in des0 + des1 above without knowing the
>>> hardware better).
>>>
>>> Does that make sense? The prior code seems fishy to me, your change
>>> seems to unintentionally change that fhsy part, but it still seems fishy
>>> to me. I don't think you should be changing that code's behavior in that
>>> patch, if you think it's right then we should continue with the current
>>> behavior prior to your patch, and if you think its wrong we should
>>> probably fix that *prior* to this patch in your series.
>>>
>>> Thanks,
>>> Andrew
>>>
>>
> 

