Return-Path: <linux-arm-msm+bounces-80439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B8161C35172
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DA6034C711
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 10:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829C5302CA3;
	Wed,  5 Nov 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prQuvqIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PT38v7l6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3384E30216C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338519; cv=none; b=pi2Ycb9GUKupAIg2Dick9RTAb2dNZLkoY2CYhIa4UrB6fkmdCZ/oT/LKUg4IIsuwb08PNiks4CAXl7nBGKVjpyv3tvALONUihkdtdmNUn8dCQ1uaVU/6vXEGiMaC+fi7NyU7Lg9zY4F8AW0rkRgDKlXJ4mJHpWjz/cAhf0PcL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338519; c=relaxed/simple;
	bh=bHWQGXUwyp0HSxQyUXCn4pC6y2/RjEnuZm/vTzwzUis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8QHh9lflriwW5WktIVYx2gro7ywK1u1cSrJxTCZ4aNjnTri/5FKioFIl5SbdgEJbT9gWpxHTQgxypgclDNCxVhIgf4UzjADpx0eJpivy6+gr+TcsqAV7butHxKQqM+0kG+lc+xFAS1uAK3fqkpFw61RWGDOXw+mt/twHVGF3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prQuvqIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PT38v7l6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53s6c83913768
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 10:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=; b=prQuvqIY2Amv7BYe
	cVEn7aZ5txx5vMjo3H/OZ/QYLOQJ2/BvymOuzcAhAesQg0BHcCGsi+dwuKsaQEoQ
	Cw2/QjIyobAfPE1576rdNBI3vH80JpvwLnh/MbqSFlNezHVsM49NhGfxqY0ILA0R
	vq/lGyY5bKiJAhO7d7ZhcXzuePYzfFN6ItFouYOAWskDar0pK7WMSu5CUUrfYTXx
	ouZfweq0n+i0bBRooAwE6KKrakOgnJmryOeMjZhVRLi/d9b3N+ivB72jD3BK3Tjk
	1up7kXC4a9WZK4t10QVgChHcl7jXXLSItX7jY8tgN4ZyVMGKVngGOMrodpi72iNl
	kFK+1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y378ye7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 10:28:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3418ad76063so1702723a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762338515; x=1762943315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
        b=PT38v7l6KPQDnln6ycL+gvRzsKo5gtbr2ymcN68mFCDKFeHS9Ti21ted3wu1KXYraR
         M9I8eq6vTt5/WiDXmJVYX+WRQcwJT29aQE5XtFBuZMRcjNLJWqUTro/9XykhJH/uiS63
         hbXOT8Zl3ie8Ycin8Hps1vGQ/U80Q6Qt+kfJu4QmFZQHJNFFS+RPxEvLVSLynh9lXnhq
         /BZfXUqjzejT03HRpidi0By7lRxnqGXMQnd0qUKZjEMyakUGcdRq1+u4eGo3Qf/UmXi4
         lP5CKQgFEBjZEIjcF7HuqD8PKn2JB/sXWZ0PJLGKYy8n1xiv+gJfuChjKt0PdLk2gDGu
         0hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338515; x=1762943315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
        b=YaniRiJNW0SXLk7WBw1Q+qvOTdb7e3U9oIEKpcDWmIw0M82lSJr86mK/TsHv2B9utf
         Tfe9qc6NUuEyJnN/pzHi5FmNt0B7TLqRyj5cIOFNRhbJCYuYZc27XC5vMI4ZTWAzmpbB
         mWCiZYy0xssPIZ1ezkKxpgMW4X9fkRG1PVqW6eysCJvVw7gwNLxYRJ+QRDhvCQXQoIgj
         nZu+rZ3vlZzd0A9Kir6upI2KTuY+bBMpJnNU82F67g+Z0jr8O7kCA8NIWDl76yGk/2at
         BAQDYJbPXeWG1SRa4WJRAo//VOuXn7sayXCk4IPhg42nkLRWAKBNz6bJHh93gdaaN6M9
         AFPw==
X-Gm-Message-State: AOJu0YwAUvWbPStTN2PbsPmHFzr+thHKf1v20/GoQeHiY+8TXEFtG5C9
	/mohLGx74h/ajdJ+mqYCqTMRD46eBig2nSRaGBRHx7lj6vYEb+v1aMiTF/s8N4LhlXEQARXmIma
	TeLqoWwRkpkZZ1VkUQXozrMaMMaS4D1Mc7fgQ88e5cGtOFPPpuzOTvEp2wN0grYvXWTp/
X-Gm-Gg: ASbGnctyrXBaPKgUxsa0exFexPylNDhc3uv8A08nFMO/BFigjE2RU+bw0NcPRJFKBtf
	AT+01Sij/RzgrOwnJR74IdOc7aOdAvZmItec5iS5zTwCv5cH8kpn8dCDWaoK4qhOc7uTt1G/S5R
	JY1yHa98ZYavb5Go4cOtPBDD1MR7d/Ji+Gl/GMHGxTM5Un+kGdWsDnMJSOMHoMYivh1uI+n2uN9
	15Ge2QU5vb0D/eJsKkkY0bl3TGcWFNjBjZVZZKRjhWIHDFVrSEOZB410EmB8crcvgdSHHMhv64A
	Y0iD/nvDgxRu2ZpOKLmbFqNfvjS4nmK+ltHeGfycCuLfXCopUBh+KvLkdMhW8CUXBGvE0/9ykYR
	IKiMzdIsVYqauyD/J4jl7erymRK1OdMWDRA==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-341a6bfbc5cmr2752084a91.3.1762338515043;
        Wed, 05 Nov 2025 02:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nab8d2/HqREAsJ22farB7T8O/NtwdkVq1ttqTloYL9Mn4A21uAb5ZKhKlMroMgSfVGcy9g==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-341a6bfbc5cmr2752065a91.3.1762338514552;
        Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd324680asm5909209b3a.1.2025.11.05.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Message-ID: <77031db5-a94e-49c3-b48f-5f7a5569d1a2@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:58:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
 <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8mZQ5HmEFk7DHE0P2g5C9aBohEALJpL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NyBTYWx0ZWRfX/DJQany3KuzJ
 IYM0jq+Ehua8qom+9Nzycid6RyOAxzxcHGY+49XhTZT2kb+r9kd5ns552MIeZVnoq95i8SSjqlG
 nkxcAqk9z+PSKCIgYtHT8CS8y443A5Z+hxwmVHuFPfzQ/1RH7i4ljpxqNvIJ+FWd/slIYg+GQxg
 ybenwK1DhJb5PCHsa27rWIEUKiMKp6QMByTTFk9Z3VBfJ0/Jx+MP6m3ws+8Plia/vnIKijwAyxs
 2CpympEYNU2uFx4bu5TNFBQlisbaVmxd9tYfc+u8QIvFZeIVVNsTsqQfjT7pc9S2ZmRfYmh8Ig9
 nIGsa1sCFYJ9KAFtRppkv7bdplMAMn03thET3cxZeBkIkCg3Kq4WMq86ePSpZwaOzz7+RxZkDX8
 JcYxKYUqBP7ttYfTFdP7icjxSf3vpw==
X-Proofpoint-ORIG-GUID: 8mZQ5HmEFk7DHE0P2g5C9aBohEALJpL0
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b26d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wCNI2q6YBtXYwDTL9A4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050077



On 10/30/2025 2:56 PM, Konrad Dybcio wrote:
> On 10/29/25 7:07 PM, Neil Armstrong wrote:
>> The I2C Hub controller is a simpler GENI I2C variant that doesn't
>> support DMA at all, add a no_dma flag to make sure it nevers selects
>> the SE DMA mode with mappable 32bytes long transfers.
>>
>> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 43fdd89b8beb..bfb352b04902 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>>   	dma_addr_t dma_addr;
>>   	struct dma_chan *tx_c;
>>   	struct dma_chan *rx_c;
>> +	bool no_dma;
>>   	bool gpi_mode;
>>   	bool abort_done;
>>   };
>> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	size_t len = msg->len;
>>   	struct i2c_msg *cur;
>>   
>> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
> 
> Not a huge fan of putting the ternary operator here, but I don't
> mind that much either
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>>
> Konrad


