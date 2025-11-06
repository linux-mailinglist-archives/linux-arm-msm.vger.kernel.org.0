Return-Path: <linux-arm-msm+bounces-80501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60BC38E95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 03:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 359834F3A72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 02:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B8A242D7D;
	Thu,  6 Nov 2025 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3xHM/PZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix2nG5ZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0B22A4DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 02:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762397075; cv=none; b=H08BmSGAyo6vSZq+cwB6DyQK4HC781iVFKADZ9oY9ZwfJMZcnIOe9uGvGUDJOXiIBmWtBjcxEEIPTaFe5uyVdEqr8pYidPIjKK5qitcCJ1qeCj9UFs+oniRKNYD2CggUiRFL9zmqOtsDBukzzge4UIlBgMRUn8ta2UNu65kMGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762397075; c=relaxed/simple;
	bh=bVqXl30PeN5EDaQ0ncGTEzN9vQj86nOGA1neWrmFf/4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r0QswFPcnsHlcDhTL5nzkYdYuLlk6etPGkU8kdKQZaIR+fnc1ndFEURNu/VlxLsWqseaTcrIKmhSaWm5hC/SG0dvrqQ5vo0NyB8g5WKkVnfl9puFcj4mXWGgUCyxDYWbXMamId7i2Sntv0g63RCTHjn+GnJZ49z/sSwVdMWpnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3xHM/PZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix2nG5ZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFAu41656934
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 02:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJZxf2bqv1yZV7BJPTYUbdETwENppVp3Ty/RBoQNVfA=; b=F3xHM/PZ/YTXSqfq
	03FrNyMnt2DQERcgq3ptoghPpQIgps00q+B6g7RaHEfK5ixaijI7A1rF4YHrlsCi
	bi6LuQewB4whwQ6ganw5nP297Q7VU1HHERIU4+kobMgT2KxDuZfKBYwGXE3uP5Z3
	xX4YFQBpaPQ0bwGhdfxPsBK4guaM9OFOeu2SsetypLIMfXCrX3i/wJIxdRNxMJ/6
	O3CJ3IHLZl7GVq2I8h7GmSX5JTIGB1qbp4fOq7h24u18lhme43/z0wkCjwFaDM2v
	4NrerQSd3/TV8cP9eFV0CoLVBGZkYUIHNbEr1rIOoO4LPcFsOclR1x7iNoygtZGW
	ZsVAAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8831a3by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 02:44:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33d75897745so1644597a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 18:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762397072; x=1763001872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJZxf2bqv1yZV7BJPTYUbdETwENppVp3Ty/RBoQNVfA=;
        b=Ix2nG5ZGh6vqbVGj90brRfZhl4WonTEbGe/5Pe0ZfS63I12xIeiVyEbxqS9lrkqyeX
         OUwoeRmCAosmN3IddOlpEvkI5uUe6IKgI2NYL5dy1ZmPydj//7QN03b+HcLbUSz1EaKu
         6fmglxDX8kZkAER5BYESPkuct4x4TkpnVgsUvlKMxqPXO/pn3l2d4VYJnEn28FM2zPMh
         StvW7HxjKpx/ueqUW0Tkc9fBdWoms7hOzCx+6J1vqegQMAUSxuoRjAx/EsyiKXfWFhzi
         LiSxYhwWJD9wTSDs9oUAMrLFtLVtjEa5Qml9/qIZHMWda+UGDb928bjqwmSJo35PPkU6
         SKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762397072; x=1763001872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJZxf2bqv1yZV7BJPTYUbdETwENppVp3Ty/RBoQNVfA=;
        b=DFw0aq7WsQvjD6xACWLSJnNtRPi57jn55wVjImYVtyPp5EiGEoItZfMrSDYKNW07rK
         zA79wjYF04fAoQRIIxs7YdpLhFmuEn54ti7SqC/6qOtz6Pe82zMJdfRWKVmq/qZQ4Ain
         Fp7A0bSis7GPeRfBFlal2Atrrp5Lo7zMre2yUGg86lj11pu9BJSmr+bdtXTT6MX+qH/o
         Pha8uckuZald3sosSxHuPELmr9UjTbLdtQaNAUqnPEJTkfh8KouhQ1P24JQz37M0pzDq
         z+3Qq7dAOpFbH+OvbTUrVlx9f0IiCmD8yiS1htJpX5Bq7AobwZgqLAiEPBAsBqMnmB7A
         ccGg==
X-Forwarded-Encrypted: i=1; AJvYcCXeWS8ypliAeFqqLcmzEO0J5+juXIM775n09N5soB/rJ+TyB1OYnJS3tu+J+gNPO2XkKpU2LiJTBbvyxgxr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mvfFhuA0cN9l61mYsSky445MF08UdfhjYUYHIvjRulIAZZow
	xCGT4lT0C+qEocd6mqQB0l9MT9QMqfGWP3iJGijXgyBJutIoOghq+lgI+bsGLjMVdhklsjoufyf
	wr23QjYOLeEsi4RyUUcmGBcLsRYNFxt0u3UweMn2XP1vvV2BTFYKhWnKLrTrOgTq6LjHV
X-Gm-Gg: ASbGncuVio6le+Znpa3BxIZhDHxeekFMDL3DRC7hVNGzEw5yuDSyUhgUDu0/NaI/fOT
	IfuzSr/UCKk9yTdY1rC+K45vcZiRtqNggjOEEDmNwTsAPW4NaAcag/+6+tXo2ZRBr3PhLwbnCUs
	pJdbsh62Ns0KvGjWtP4fjuTeW+xHB2crx4dT0Fuu5qrnaz5C3X9Lsw94xsLZm/N5oDF+ywjwyAJ
	JsR8b7ZzzYoJHGISw0Wb4pfRcojdKVySOpGUmPJBiDnSsaINT3DP5sn/W58ZxSADxoZYWARCiIj
	29jTUQ8iw5p+esFBQfeQeG4TOq3eiYhEJfAvkbeT3xc5kYaWjgaxUJWQgU9TtswsSrQ6bAPO7Me
	hCXQg5VTmIr/q/i50868pMLQhzY5Wj4jGX+tcXCG5PFvr2NE/qTB7hzLRxOTED77F9HmuVQ==
X-Received: by 2002:a17:90b:184c:b0:340:bc90:d9ad with SMTP id 98e67ed59e1d1-341a6c5e3eamr6365706a91.10.1762397072314;
        Wed, 05 Nov 2025 18:44:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVTjm2EheehjKR6voJp/RgJWjUbH/r1DPK/fikAlb/nj6Q+1UxFzp2FFpFLL4XSe68SPy8QA==
X-Received: by 2002:a17:90b:184c:b0:340:bc90:d9ad with SMTP id 98e67ed59e1d1-341a6c5e3eamr6365681a91.10.1762397071710;
        Wed, 05 Nov 2025 18:44:31 -0800 (PST)
Received: from [10.249.17.198] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7f661b71sm874030b3a.12.2025.11.05.18.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 18:44:31 -0800 (PST)
Message-ID: <f1456b34-9897-41d9-909c-3fac77e17bc3@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 10:44:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v3 1/5] media: qcom: iris: Improve format alignment for
 encoder
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
 <20251104-iris_encoder_enhancements-v3-1-63b0c431b4d0@oss.qualcomm.com>
 <d21b6376-3b20-4171-9037-a6faf4e438a1@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <d21b6376-3b20-4171-9037-a6faf4e438a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4jNOi7AooWP_2sTNIxbAmDgTqTcYOB2x
X-Proofpoint-GUID: 4jNOi7AooWP_2sTNIxbAmDgTqTcYOB2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyMSBTYWx0ZWRfX8LfXJjScjdoS
 e6sMrKShF0seARv28is8f48CSFAyF0Yr9belzoudLrTE5qd2YPpA9at3iojFrScEBclz5vV+DXr
 wkLzEHWEqiP9C9q+EdEcCsLmF1Ptb6+pxeb1I3RibhVi/nvtcak+O/1BkBe8g3HeYPiMT/FMCAB
 aT7/WbuMJF/lyLZ2YBXOFIm0afXL/F+37ZWYdGQSkNRaR1UrcQB/XxwOmIASWk3UjbrjtgSemQf
 nFcaO5mZ3GZqWTISW0ju2lo/xhezArAyn0L5+ySAEnHDf8yhGX0d42Hgvr5PIdxOByPvmFbcjDF
 V/7cvgsyst0/AQv+xLa18wevAv6WB6ki8lVzAmE6IK1yQ90IN31hp5aLMhRWzhgooINqx9K2q87
 leLzPZ5nu1hfql/GsFMokMajLetf/Q==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690c0b91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VFZlysSXFxogY-LAaxsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060021

On 2025/11/5 20:29, Vikash Garodia wrote:
>> @@ -231,10 +233,19 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>>   			top_offset = inst->compose.top;
>>   		}
>>   	} else {
>> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
>> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
>> -		left_offset = inst->crop.left;
>> -		top_offset = inst->crop.top;
>> +		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>> +			bottom_offset = (inst->enc_raw_height - inst->crop.height);
>> +			right_offset = (inst->enc_raw_width - inst->crop.width);
>> +			left_offset = inst->crop.left;
>> +			top_offset = inst->crop.top;
>> +		} else {
>> +			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
>> +					inst->enc_raw_height);
>> +			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
>> +					inst->enc_raw_width);
> 
> For capture plane, offset can be calculated from inst->fmt_dst- 
>  >fmt.pix_mp.width - inst->enc_raw_width.
> 
> This is to ensure that it is consistent with what we do while setting in 
> iris_hfi_gen2_set_bitstream_resolution.
> 

For downscale case, enc_raw_width > fmt_dst->fmt.pix_mp.width, the 
offset becomes negative, so I think it should be kept this way.

-- 
Best Regards,
Wangao


