Return-Path: <linux-arm-msm+bounces-109794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ny5K6CCFWoSWQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:23:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8F5D4D1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CA4230433A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126E73E024E;
	Tue, 26 May 2026 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hb3n/hA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="af+v23pz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7C3E0227
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794539; cv=none; b=CiIXvHZPcTiR2Q6au9jnPQKTM7b2dHleafqEVXfc8vdI6RvQC9LYcrRExKuXFWNvhbVWZrLYz/ZeULV75SYUp3K4H87s8MdaPCwUf+0KYBpWPQh3gcs6H9x4GUk5jxXaKfmAXve7d01SBdfugrR/iFh+ulrJRF5piE2hcnibizk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794539; c=relaxed/simple;
	bh=tRGGCO71eDtxTc4WzeqTKxldH+vPmJ0nK7h+b1NqrEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ES7VQ/iYNwcT9Xp1ojMnVSF6A272toIAJFHzC79Xyyvz3pJDcR/rw5GPHXUQoqFyvvS6pap1Quj8JRWIoclnkgKL5yf0MKHNT7670HcAIvmd1LPrQo6Lka4x91fZyqp9b15Mnpxhk09yErbgZrrCTyZRsqkqpKbtwBRboHutLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hb3n/hA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=af+v23pz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8x7HQ2823127
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=; b=hb3n/hA3sWQtchUa
	2xujjhW8UFehd/jQIvqNS4Onx5vfZ0Fg3WtxZ7hV5HOGt7xdXh7nUTbiBm+YNYMe
	gQtinOyNO2/Yq0XJ2SKoBdbTiFJujZ/SgmMpLngi3pWKVGq1w/h8VyML2VqiXOac
	87YQ+M7pJmuitSQF/YO4zUFd5xD5n4uksLNJ7U6JGrW5EQ6PU93pzMwhDCU3smsa
	w5sPvbbq6y3YY6wcEJ0T1ePLvBYY2DHNNSa8+Oof61vpNNHAwJILd6hXannEpLe1
	zf/tVRz4/b6Wu32plhVZVYohcdn5fCOuMRPhnNEer04wjwl5gY4w3oU58SlnSxDu
	1eFnwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwugva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:22:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8279604464so13313001a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794536; x=1780399336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=;
        b=af+v23pzU6bFI40+SF6RrvY3yWGYCzrNxra9UhlNRggnKazVQH31tpi7ojxREfYWBz
         X7bnl/nt+hCS0i/tjMFMtx9N+KnzD08uX21asq9mdR9VniriwgtcOJas4lBLVoHLMZ2/
         ndzb61CYfcx+N8hRzRHzlzyQ8XlqpYNuBEywymTPKMDGQaO4/PXCq/uiv71EwuVKBH9z
         ueURwfJ2f3TUT8Rqpbnpp2L4cga/YoNOFXj8JuGlYpDm2mpZi84lsF1pQ9XB0qauJPtU
         KuQq1X3R8rmKBVIU2NXRFunx5Vge0CSrV6W58tU1Y6sgl+YW4+zwlHHZ5RpJ+YrMZdyS
         e+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794536; x=1780399336;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WnpyHJs1NmxwCEAJIlKsYN64HQCUrUukJsbFW1tZEk=;
        b=HOCdHTQMPz3aZdgDIjDgnAIqOefK/9zpKR5AJ9oOkr1DSjQ7Cb2H4hSRirj5Vso9rx
         zVDXZnme1ZD7r+2BvH8zk2BiM4ZK1cI4uYo6jBclmbSuiWDt8rY1gdQROK1cjo1DctPC
         vD1tzcetu9U1w6Yimies5T2CbyGEAR9HO8NmRcoj8lL1K0eRCNZUIFEhTm3HJ4e7YFjn
         8GEOi1kmHoODSTxxnnLTfIoOrfm3n+Zl9D/tBXtlPbmEqGtQAqqKdfJYU7ov4UWFS7kh
         6fOleRYbtwddPVxYG6R7NEsMP6+7xii50SsmSINt9j0dMxMxaRwG7Gi2tde23qdQ4tYd
         FZxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QZc6OmvnEIZxfOte2tBhU7zbGA6dSykeSYFQYtbgsdQmXnrVIyCiNzp5UdUM/CsoM/VIN0m0dDUf9zi3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zqE1muZSObK7Cz347G9Hyy2lX3CbvTQax6oLdUFbMQIOFPIU
	BYhRZCgwScd7cJveN62VpcCuSrXTU7G1pLmL7NhLNTMn4/PJNQe+QTXDAIH8Dz9DIQsd1cLFsD8
	AahFacRim1rEaLY/THi7NfuCWi/28q3kCNnq81jY77ZL/MKzlhBoDC4fhjeHPTSviEYIC
X-Gm-Gg: Acq92OGthF0Lz+EMYnC2JBollSjfafV1U5IPGg8jh8BxmC3Nm57MT12jrhzL3UOoYk0
	Lz2TmLuCeslbFNK7PlC7ps1PC/qkJ1bbQzPy13sVoQGTHfxxkkMOBLCc90sVvReexVmrTkFauRu
	V65xXb9z+xNkUtswRDYZT0ytny+YjDso4dGcf/IoKe/MyJ3Q+ZsyQO/Xw2+n6CNkzgO+o4h7/9C
	b+H7naLWt4zlR7DeJTZYsp0bvrkHskOISL3xC+kywixrW4v7nTtj0rOKuTM9WLyjHmVjpZFMmn6
	hhV4YeFazXQ6OhwbhSjHHLQCXvmwD7rZ2HqslRXJBnTEEBi6/p8Ycc40Hc7vAVwRnB7StDHjQPb
	OXp3CkTM/FeiPXLCWoWn0pkx1tVCzTGT78SOZMjk372XGhXdcAgauOag2pZSMY5TE
X-Received: by 2002:a05:6300:6d8f:20b0:3b3:62be:3241 with SMTP id adf61e73a8af0-3b362be384bmr6464399637.8.1779794535880;
        Tue, 26 May 2026 04:22:15 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8f:20b0:3b3:62be:3241 with SMTP id adf61e73a8af0-3b362be384bmr6464354637.8.1779794535248;
        Tue, 26 May 2026 04:22:15 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm14725994b3a.10.2026.05.26.04.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:14 -0700 (PDT)
Message-ID: <63056c1d-a191-996e-b556-e636ca88637c@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:52:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
 <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
Content-Language: en-US
In-Reply-To: <fc2wiqf6vxob2lzp4fypekcdeuf7mcmn7znszzm5drmlkrdndh@ph5mgjaezdzo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a-27tUBh_9iyP3TPOkHFRMlgrL2D6POa
X-Proofpoint-GUID: a-27tUBh_9iyP3TPOkHFRMlgrL2D6POa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX96T/R4AIXSlD
 XnuH8n1LWVY2NNn9y/vXE9LMhVk/aR24YmRihBvU6JjQqd5fb7lpHhpt/leDb5HP1hA8e3n+8BR
 9W3EcMn6ONdXQV0vpSHaCc+ZFcPuIY3I1pMiEZwUdAtyDjoO76KZnLpGxiMlZbzTl70lgAJNJ+2
 tGdL+pcNKdqltiq7lvWmOJXoJtRSi85XCvfS0kAZhk0vyw3MH6WzM8AbFTxfxJ9udMDJQcCOslO
 TKWr5z5UToL94K7J77aDog4eM16QcP205ZLSj/SRQ2sSRkxC4kKymsBWAxdvdkgD65IraUrOT1C
 zvRkvjT6rbol9RVjTPSYtNWobwrA7k26yK1+OvboPyUkpdEVyGo9moUe2IGC86vK4XRvif0qbNw
 NysM8qcvJ4GTbvrEdqtSfHdL4jd0wKKKisgXBJrOuw6U0DGc5pyIV5YmnDOUA46TKW9Qe2s0LsE
 t7AmnRG5NIIqrY+9LPQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a158268 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y5j-N_kvQXTMkCsvIs8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109794-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28C8F5D4D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 11:41 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:28PM +0530, Vishnu Reddy wrote:
>> Add iris video codec to glymur SoC, which comes with significantly
>> different powering up sequence than previous platforms, thus different
>> clocks and resets.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c47443174f97 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,glymur-iris";
>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "iface1",
>> +				      "core_freerun",
>> +				      "vcodec0_core_freerun",
>> +				      "iface2",
> I can only assume that it is "vcode0_iface", "core_iface" and
> "vcodec1_iface".

Agreed, the names are not self-explanatory.

Krzysztof, do you have any input on renaming these — It would break the legacy
naming convention followed on earlier platforms?

>> +				      "vcodec1_core",
>> +				      "vcodec1_core_freerun";
>> +
>> +			dma-coherent;
>> +

