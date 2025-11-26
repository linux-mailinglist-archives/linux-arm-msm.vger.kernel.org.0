Return-Path: <linux-arm-msm+bounces-83378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 900DCC88346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 07:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72C06355B7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE20314A73;
	Wed, 26 Nov 2025 06:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALcucnHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cb2n2dEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EF3F50F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764136948; cv=none; b=NwQ79z1ye9HfGfyyGA/k8gdoX4u9ESWHK0v/vFEj3TMRVAKfjzfsVQMn5INfXiCR/XIHn7ifiK/S3Ft8G/0T2eiWOqGb5DKTHX0PDIqQ9YnHO1flWCW02QI8F34qnYTDCAAfiYW1/nVZTK8gc+0cd6iBppK8Wp6xGMkcfaoKeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764136948; c=relaxed/simple;
	bh=dyl3/ntopNbv3yYZrrcoXgHieaoSmqCTWvqkmEhoeps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCf/tN376P+yqLGuUYDbk6BnsxsCJhxuAGT4Y1MHziMmPh42aF+JeGNNs6qvhwCmSEIvpLNcp6ONcIEvRhg5/Wf5hTxYWYq1keNDVuZUgkjKF3AbX5tE6WPHqrLJ1/r6KBye7x12bwg4gOikkp8Gw+qxOrSqQ3cfh7vpfB/6Rj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALcucnHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cb2n2dEu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ1L4hQ3317309
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjciP6a0IjtUI3khiEOBEKvlx4zrrgo6zDwtEPrHGbA=; b=ALcucnHxbdsQkIDE
	YFTT1NZt8QfrlVMGFvJ2R6MnnPeB7RyYWksm1tbO3o+id894Q57RzEJAMmFj3U0S
	9XYLx01PLjGYrkBYTrr4ZQtwm36IP5GS7EJ8yA1uD/e0VpZ67S04i7m85K1sOIUI
	LNogdGzYN4sD0xpE4deOXjDi+6BzOEdVlQgpiDhqpsN1jVY7On27+Q5F9wFCscuN
	VohNkhPk18lLkoGl0yoAmqb/c3ci6xFvdobSYI8VVPAJoeAgR7/I2SoF3l/JBs24
	IcWM5tKRVYvIzlFk9ltWjruOS7CzGIVBIL+4DlG+0D4qCyU0u4PsfvKzO8BIMAjh
	U6ItUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qje9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:02:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343806688cbso15094208a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 22:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764136945; x=1764741745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjciP6a0IjtUI3khiEOBEKvlx4zrrgo6zDwtEPrHGbA=;
        b=cb2n2dEuZ+XVpe2bI9riqOBfqsel8KL0y0fjbcfULoRM3jsHtbvd/0tAo851/zFYcQ
         IPpldCuUOjNYcy2r3ROJK7oMUGzrIXw4U9PqUkyud/Mvg4baNilkNTmX2a7JtpG1omrA
         3aqtnHtzEoP9Vjqjqm5A7cKL/pvGTjDlCuHMlMNZTAd8SMUZurcrGEAIZYcdO7/ZR11C
         DksZ+7NnsbBeX1OIa5tfQMDjcAweCEMgRT4dYyR30j0uP22jwlnNoqUJu3ssfQfUDtlV
         x8pbI4u39YeJTah2VVi39SAORqu25OwPZubpRK5VRkY47x5IXvIcEv2fQArtXUUd//dk
         UmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764136945; x=1764741745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjciP6a0IjtUI3khiEOBEKvlx4zrrgo6zDwtEPrHGbA=;
        b=jDgDgL8iavhYwHK06IFxpMESLvcwiFaOfeYlukJNRhcxmb7z8h9B4iFXApSlA8er2H
         Ly66jwc8UPaIeqPabeePXz7ABH+fftUa8llApeAeBV6q3dB8/n1xdoMbrhT+FZ216SBl
         yLHkfCdo1NsgmwulTugfdcvp8FTaACt6UPWWNVN/IchmGwUmRomnwxdAhHwrZRv7CAX4
         ZtUCKbiX4oiJ6f/sCCv7yJ5MfBDIGiQrWLcMspjkIa9OmtL2qN0TeQ1BxLNbZXd38Qdj
         Vv/kwlBXFeCFuL26njfn1/SH1tNmZ9tQYJq0hVl84OwWiRgarxJSb1ygPLIZ5n3EVsE3
         affQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC4et9C+AXAGfyozpokRyGVsOvovVKqFX0I3HTDZyuzJy/L2SUdc9FlLgRd6/2apdWvQXhtTP275zNHaIz@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqrCc5xFyGIGG4oh2vYKGm7OfL2W3CLVGCcdFzfNEnaFvq2SE
	xWR46csCiPxtdYOWekNYiDoxID/EXQF2LUsIRnjlPiiIXds0cNV9yeUgj45t8077TI6grgvUW8G
	MImJlfVBShpsSP7RT0kKf8yMm0IyRSIqIW/Osi2dVcmTI8+9TyYQgm2Jncb+WBCCk3eLt
X-Gm-Gg: ASbGncvqbmnovxmFmiGzeIptYiAvHNPvYcu5EyDSSkCnJjqTXKtb5AVqGRWsKW1Rq2h
	WNCnx38ON6XULTe7ngQunTZYHk38Yv6DtrZg0rkVlrgZN0hxmtACCMn9VZh1Pc6R6K6zbgeXnSJ
	8bCK6oeqHgeBg3TFtHI9zL6OP/n6q5d0RBfNZoY2fhPLWFzKu7+FdXrxiQkyK/uVRtMHxdRiBYN
	hSrFowvDqee6GoWV6VWS8B67ZpjIgyA59zoy3VytV63SSpPOFEbP7HeWfXUUmxko74XULllJdYE
	2H6a7aSEBA4v+2Q+sdmJ8Ge8/y9qkCq0JFuPn//5xtLA//mpJoZaqexRHY57hUeZgmudGmtFlrK
	PSV1WA3p+qIWX93RiZEb0pnWLjK76qCM2vVOZb133/Q==
X-Received: by 2002:a17:90b:5183:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-34733f2278bmr19709015a91.17.1764136944629;
        Tue, 25 Nov 2025 22:02:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHel1qAda4IjKOVHP8XaISvlRtkrTCjU5jX/Ea+jQHwfDaLvLGE5EziIf1nQXJ3erB8dBXmSQ==
X-Received: by 2002:a17:90b:5183:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-34733f2278bmr19708971a91.17.1764136943841;
        Tue, 25 Nov 2025 22:02:23 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475e980f41sm2286889a91.2.2025.11.25.22.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 22:02:23 -0800 (PST)
Message-ID: <e2b33a10-819d-df49-0687-74f6db4c5a05@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:32:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2
 only
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
References: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
 <wq7kaelokxqxkxxi5cvp7sz2az5hlam4nyyt4v55zrgei3jsyo@yyefysdsw3co>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <wq7kaelokxqxkxxi5cvp7sz2az5hlam4nyyt4v55zrgei3jsyo@yyefysdsw3co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0NyBTYWx0ZWRfX+yywiYi5P3uY
 N2fASbGt2Eo8Q8Bp0+ve3995SVY7i6rV+jJTtAty+oJJiPadw9F1OfHW3p86/qlAeNjYvDv99rS
 YC/ETkTqb6BFTHLyvY1lDDT6lY7x98lTVS3bPGWmB1PNuNrcBZSfW4ztHb1MTa/MgHxxmfNuUpa
 0tQCJgm+PtTamSXEwDhhnwu+qGzjxBvLbSzW3vr4P7AHHZXPB+J7xq+3KNry26l0rPI9z/2TbGP
 8vhHGW7N+EYTdw2bV0iyazWHOdVt0q2nHprnZDVDgkwdBv0Et4JIvnwpwmsrlpd04/q3xovfY6V
 bzJzjMw+k/LABeOPQJE82wq76AZ1fyJRMUit1sPdLRycREUH33THaNiUF9C+cJxs7+Y9JMXhHX8
 vZ/p51OzluDdODanxF+96GsW5L7pOA==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=692697f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GE1HXsG9Zi4TFkiVsKoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: CVnIQseoqxg_R9a3BcApijb-f0TWTbWy
X-Proofpoint-GUID: CVnIQseoqxg_R9a3BcApijb-f0TWTbWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260047



On 11/26/2025 6:43 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:04:19AM +0530, Dikshita Agarwal wrote:
>> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
> 
> Hmm, interesting. In linux-firmware we have VIDEO.IR.1.0-00005-PROD-4
> for SM8250 firmware. This version wouldn't be parsed at all for SM8250
> (nor does it follow the format string). Why? Would you please fix
> version parsing for this firmware?

Right, Seems this firmware doesn't have the proper version string, I will
upload a new binary with proper version string soon.

> 
>> not handle a dummy device address for EOS buffers, so a NULL device
>> address is sent instead. The existing check used IS_V6() alongside a
>> firmware version gate:
>>
>>     if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>>         fdata.device_addr = 0;
>>     else
>> 	fdata.device_addr = 0xdeadb000;
>>
>> However, SC7280 which is also V6, uses a firmware string of the form
>> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
> 
> I still think that using commit-hash is a mistake. It doesn't allow any
> version checks.

Agree, we had this discussion with firmware team sometime back and for all
latest firmware they are having rel version in the firmware binary, but
SC7280 firmware binary would still have commit hash in version string.

Thanks,
Dikshita
> 
>> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
>> condition on SC7280. Combined with IS_V6() matching there as well, the
>> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
>>
>> Constrain the check to IRIS2 (SM8250) only, which is the only platform
>> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
>> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
>>
>> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
>> Cc: stable@vger.kernel.org
>> Reported-by: Mecid <mecid@mecomediagroup.de>
>> Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
>> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fixed email address for Mecid (Konrad)
>> - Added inline comment for the quirk (Konrad)
>> - Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
>> ---
>>  drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>>  
>>  		fdata.buffer_type = HFI_BUFFER_INPUT;
>>  		fdata.flags |= HFI_BUFFERFLAG_EOS;
>> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>> +
>> +		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
>> +		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
>> +		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
>> +		 */
>> +
>> +		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>>  			fdata.device_addr = 0;
>>  		else
>>  			fdata.device_addr = 0xdeadb000;
>>
>> ---
>> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
>> change-id: 20251121-venus-vp9-fix-1ff602724c02
>>
>> Best regards,
>> -- 
>> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>
> 

