Return-Path: <linux-arm-msm+bounces-93510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHfVFJ9vmGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:28:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC316857F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D83303FA8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1006734D91E;
	Fri, 20 Feb 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRFlMzhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yjm9SSnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EB34B185
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597716; cv=none; b=nLwq0ikGhg5+I/riO21ufO8L0uT8Cj9cTpU7iypMsQuu9JDY8q8EwpfCsFJyMrhEV5HCLhMshUZeALHgFX4DJe7SL5AGKA708GbJpy58JkNuR0GmuCvQ+/4jHZPBAHlnF/t1wYlSWLJXStx5xc282aqnJuAuXARstB/ZpDNHbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597716; c=relaxed/simple;
	bh=h8Htp+mwcCSaFJoL2ZEOywZTV52NZLG/fZiK5e0KbaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUL1LayLDkAxd186MDI5cfeZ/5bdEVz4qbe6p74YWEWcJDCnfZ0rdGalAWSrJe0tbfpr5dryKrbKVNmaRCYmD+LbPgKHQnoVHjueBV+d2VDHRfDK42f/g5xdj4b/wQNDedymY+rJwxoetvatgWCUJh0hOkih/2Qls8UmEqsP03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRFlMzhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yjm9SSnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RngH1851275
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk3h7dcBRqCUiXmykbi+R5WQVC80hbSdQ7sCUeo1Pyw=; b=oRFlMzhUy6spfivM
	mVl4UGqETcOOpRQ5+to9ScVvHVLZRsICivl02HimrMbUzfQvH1N/0gyT3ODpj5qf
	IbTVjrIo7WNxWafgKhQQPVevcq2jOJK1pk8Zq0VV8VXCyQunit51sXjd1+mRHwxZ
	UYDZIqdgfVvpC0iCP2YYKpBeVMihb2lcCTp9En7KT025D/yhG+kJQeY11BEAEPWF
	MM+pUMhL2YhwDEmsQRQSz6U80Gja98fz+AKu5JccgG3E5WvxYlJ/00DThsTmD0lb
	LjiCXY4ZunqF8XIPFTcaJoA+V5llXxbmJng7dWzGY19Upy/sbblw9RWhikreaYj8
	NF067g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce9ngacc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:28:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7a98ba326so34685125ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771597712; x=1772202512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gk3h7dcBRqCUiXmykbi+R5WQVC80hbSdQ7sCUeo1Pyw=;
        b=Yjm9SSnS6WSwQU1wtra9AKnssoiogfSOpu0JBpjD3IbSPOD77PUSpwUjtDHuRCMtxy
         OfMAk97LxcLxIyMwxkdL4zAXGh16cKK40jK23hCsw3u85VZac1jctYT4utUO7N7cLaKk
         CTHDaulgjbvBQOm5yUs5kfOYY4f9qV9mOP73UQeKKogVqVsoHG3DRrYRRNRVn6u1T35K
         kx37pNbRFHTCZD9K6n28xg9Pu4LoUsGs1Fg3en0qzN8OFQu6C7Qc2FpzlEqJoiP2XjJQ
         M2ekt6wbTJtLhnSoSQqbB6fn0p3hLCe1vYM+mT15F88b7uSbam8ONl7oj42vWf/35uYg
         rP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771597712; x=1772202512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk3h7dcBRqCUiXmykbi+R5WQVC80hbSdQ7sCUeo1Pyw=;
        b=X0KCq55yLfTWCnyr9Y/MWJs9PWG6rHPeFas/+JBOotBt+WBQVcdA3QwR66724CZ3ct
         wBjq37RFwfhARa+QzDIwstq/zRpVbw8OfBEy99eHZThk3kOdp/473iClLXPrGmysYs32
         GTdBdcxRu7+2OZklTlFAkxv/BSiVegdC+NGi99SyAPlNNeByEwnxq0c/iE0Y55Litv3S
         nAGgMRC3cqHHaPuCfO0lWrVPXW9hXUj05kbNq62Fi24UaH/jJJCUjGcH/eEIXhCIfXT8
         bRQVvM6rlggAVaU/ZQd1lhsnNPFcgjaGckNz90XWF8ovUHC3Xa6OFsRg+BW/GiB+hWr/
         kKww==
X-Forwarded-Encrypted: i=1; AJvYcCW5RuyhU1VL1mySgdHKGDF0DJnWjldGGYYCY1v1cB8JeaHqlbILNn9PbXES2anolhQ7uQWxUrrNoO8Q707C@vger.kernel.org
X-Gm-Message-State: AOJu0YwXI8N2nxqGAd+vqqvjdqocgohaSv4obND2c7/u12F3TI9jYZxc
	9Wxfecy2TaK73OR+fQjqCmU9J7FB9hiRFaunacnE/FmKqi6vagMxDoRKSAUYTXXYxJQjSmWXV8u
	yd9BFCuwAO0DloJpx4HYgJHKLBrEOY/T+d8hFKeY8GYPebXydnx3vPLQCIUtErdvmTQTy
X-Gm-Gg: AZuq6aL85OlwfUA+kYJalZhys4VM4PgAm6+aT2Br9MG+fo7QlgMESEA9Bkh/0W4Z3hX
	L6vvOAW9vyr/PQEOGlKg3Bf4STKV3s0R4Tv3SWJTe9+nJeci4Y7NDpxrJL/MFT0X+YKFg7ZFyQN
	iyqdyOQM05Vfjhdkauftkx9HJuS2XpWiwbRRvKJFc6H1X6kwLEFpHJQtoZKjtc3BpCtc6MTB1ct
	Mi/4wbRSvsjNEiB19RF3+lr/ah9tjRoPhh0B66l17Us8tP8WzeUwOxrBMORuLScRPkot7pICPgx
	4g4+7rFui7B42ZPwDF9UF+ogt8iPQB1zichTJpcnXoZPkz0fNfYOyBN3Ebf676aHlaPM0AEtG2B
	5VovIDcvB9TzwfiGpmtOJgQNJDsKU2cEBTIWBT8B1j6xHJl4DtA==
X-Received: by 2002:a17:903:41c6:b0:2aa:e9f0:146c with SMTP id d9443c01a7336-2ad5f7b9775mr64576345ad.29.1771597712489;
        Fri, 20 Feb 2026 06:28:32 -0800 (PST)
X-Received: by 2002:a17:903:41c6:b0:2aa:e9f0:146c with SMTP id d9443c01a7336-2ad5f7b9775mr64575875ad.29.1771597711850;
        Fri, 20 Feb 2026 06:28:31 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73b0fesm195782515ad.38.2026.02.20.06.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:28:31 -0800 (PST)
Message-ID: <00a1e492-1235-4dfe-ba0c-b1cb7c43ae22@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 19:58:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
 <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
 <c8e9eb0c-9c49-401d-ae4e-21dcb1e1e843@oss.qualcomm.com>
 <a39f5526-8727-4fb6-9a93-36f412b93f88@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a39f5526-8727-4fb6-9a93-36f412b93f88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyNiBTYWx0ZWRfX+o2a5SxWK3CG
 0G+NJ+066NstPaMNPqCP62KfP71AsFVtpzyG1SA70XYoW9kTOdCSbdJ6V7lPiwsvUAPl7SoCa0h
 Fx3656POyYYA0plAD2E1BGTf5ZkSmf46Nxe53KcWFIaGVhU/FK/N7b+MF3Bm8GT0aq3XRvmmozj
 6kTrW5Ql9u6znombqrC3AYwg3zMcrJUgX3vgE1lt5CaHLUe6uMWenjvft766KQpLE7Gh30kwWBh
 2SdeJQ6i48f/gPJUMYZ3PW+aCfsCzyNwvF6iZqyUqsZF8imjDenew+EyS774AQi8q5PSut7RQwq
 ten+JOhJQVBoJBaAnkjD7y87YsHkgLAu6N8ujtHdycrngdX6duG3CIgiu5rLu+7iQpF8K1+wEr+
 RF5hySMiOzMqZGnktmlZU5LU/fV0fAGaBr6F5+4/MHCOvHzSC4tde15OiMTlWw9nUpuRbiB3sGG
 KmCzTdxtpYlkcAkftuA==
X-Proofpoint-ORIG-GUID: kDafyj5rE1w9pwyzPXim6fNY2t_ravdP
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=69986f91 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Zk7Ki20fgETz0Ru4rw8ykQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=JSsU4YdMWw5dEmU7CcUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kDafyj5rE1w9pwyzPXim6fNY2t_ravdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93510-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5AC316857F
X-Rspamd-Action: no action



On 2/20/2026 7:55 PM, Konrad Dybcio wrote:
> On 2/20/26 3:23 PM, Taniya Das wrote:
>>
>>
>> On 2/20/2026 4:25 PM, Konrad Dybcio wrote:
>>> On 2/20/26 11:28 AM, Taniya Das wrote:
>>>> The camera clock controller is split into cambistmclk and camcc. The
>>>> cambist clock controller handles the mclks and the rest of the clocks of
>>>> camera are part of the camcc clock controller.
>>>> Add the camcc clock controller device node for SM8750 SoC.
>>>>
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update the MxC phandle to use MX for camcc node.
>>>
>>> My point was that both MXC and MXA are used
>>>
>>
>> My bad, even I think I got confused with this. We really do not need MxA
>> voting as it is always ON. We can sustain with MxC only.
> 
> Does that mean we don't even need any particular RPMH level on MxA
> for this usecase, just for it to be on (which as you said it always is)?

Particularly for this usecase you do not need.

-- 
Thanks,
Taniya Das


