Return-Path: <linux-arm-msm+bounces-88251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED76D087EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 11:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C34983024105
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E3D335544;
	Fri,  9 Jan 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjQU2HeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrkQKgs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A13370EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953714; cv=none; b=JAXpJtTULTdBNK665U4pzc8kK55yDf2Tqr/s7dsjqkadyc7+ippD9/MEesplbagDgn+OUN+g2rUZpf48Kq799q70peEKZfLfQFdS2lvffIn2v04uaAYq3rPCjwKoXj1aRAEewigO0S46ifSLfON4pgYghjEEY/th1DEl3TplEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953714; c=relaxed/simple;
	bh=ZyFBpyLdbmxF4q1S84VBkVEAwIdbn3sylLoQzPhCTps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6IIXniy5v73mAhjZEotTjmyW1n+o3nw/+VGqJw6bJSMGjFj6zl1cBUY7qb2+Y00oNMQRV433weRT+bkvki4VV/8ISvg+uyMHzW/TPb+CB9eLBmTumrYlHTA3TcKbXS6clAGtFMdwBrOxYoK01l7nG9b1V++7tH+T1nRmFI72Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjQU2HeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrkQKgs2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jC5g007844
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 10:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=; b=CjQU2HeWo/Mh8/Sh
	vHHbRJ17dlZW3mjmMItl7GDcTtbsJAinojHKbUtxMXtjWN+l+i56IZo87ASh2p7x
	Zbuj72GIoeeKcnC6iREWCHgQYldsOQpJE/yns7pND7BwVRqxxB74YeAXhAwxhzvg
	OHti7K5mzCuyBaidbsljJVVs513X3WTK67RbbQAALg0tBpQ6Beqk5gA36Dgxy/+h
	CsDLlCghGzMxYrcV1OGy43Sn0xdA47gj1rt5llyfAF/GrKGSQOvrp+/9YZphclBL
	tcWcqCxcoJvEHAoc7d7q2n7l5EDnOwMRwFqMxzqv0PKBTL9eXi51ipX62KBgNvRP
	b60CNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqg30j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 10:15:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c1625bbc20so110229285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767953707; x=1768558507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=;
        b=FrkQKgs2dM32athq1agvAu9Q/cOQ9fvUF57afPECDb5m3xF8WDkGFdZSknQz44D1u+
         zUHgVac+AFAlHbhbIC8jNCBv+08RuJan5poGunAPM7lTq1zJmEHdsHl1YQpgR1I4SWAn
         STbrHjq4r70O6cqN7PdnFDdvFkycJIR6QLJQhweFzxXz2XSQzU/J09jVZdT8p3DZZJcA
         bDLDpWB/HWsItmsGjXwjBc5RfkFB1pXfPjMgdMte/dUhf7BDhJI78fdzszyPOD+pyY0a
         yEyb4kPNADemaziqR7YRrlfhF0GTNfRi0mvLWayaUhgg+q69lUMAECkHuFbKTVsm2ddC
         Qxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953707; x=1768558507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrskKRW4Uelq9Mbdgi8O2eVhyYrlJ63nQrd4PplXr84=;
        b=hiSlmaAS1+ok42YxeZCdY3YnfsQzwHhn6YDqTL4EZU2A0nhyR89GO8emBIRwBCtWGm
         +I9pgee1BB1bhHC/UstcDcmau1RgCliWOx96U5SengZN+a53T4BaiN5Vs4Jo6Vpgn2LT
         udqGJNBKTBAjhYl3kV84rPc/anguUgKxBkG7Qg2YGXcUoNc18RcqxDCj+I6bJIgCIKZA
         wKNrZ11QU8rbvzhBSkut1uIL7VJ97/fPlBIrbZq5T09cpWuJ2hur+iA+t2fbWdC8aF5o
         PkDqLRzHzZPlUFduFNxc2YeO/6tbDVybS0VuWcpANtgBGTdK3ouIl5D0tpTdNVynFxaC
         HPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpTUV5pU6dIgUThM3yaOZwQ5EblLP/BeSy7R8YD2E5pP2Yb3872fW23Be4aY+70e7mYB4AL0a+bExztah+@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9gugS9U9wVOqGSkBz7aU3Nl9qqDsE0IyHCaHU9B9Fs6o1RqG
	FSxnScMY6cOdpSKfUjhL8ewCeMbZ+8SuRq/SIluFvZO1CcACqdEHHLg4K5ZD8k9tE1SP00kDl0Q
	IFUrOLkT2ekD8o107xlLlH7eQVNKqLvAQrZVLIe/Xm0zgvs5R75NJAZYzlCgbZ+fFVHxD
X-Gm-Gg: AY/fxX4bua7vAbnwFpEAjl19erJHUxbQlvMmW8DU33P/43F8836Jt68I8JxGQjxJJUc
	3Zb+fhuA4AHqDLB3lhQnSL2S1yyvUF/DyFwxkkBOjYmHG9GAmssUM6WG1bL+YXtaNTtuGpNU6Fn
	2BmcHH9A5FrPIkPIRKUeY9EY6f5VD2MLIFJOYNOXzCc7HFeuXmHGKDNNn82ejc5Y0cvcetR/AS/
	SGPp3HRWXpLXVwg4YcP8mBrRggR46YQRC6DneHdWc/jTlax3ThvS0Pe68LwasbJkb5MeEFpby8H
	jIQivxKY0vBHmbQx60cvzz73h3cxUbm6PhW0fgCymaeqz0E+a/GNkK45PrBlDcnR3G0xIKJFSdB
	P1ljRu4S8WQ2jRVrocjMTQIoj0ae7NKcoz4i8PGDalbcZs24Q+BZ0nRdRNnBlsE1AZ1U=
X-Received: by 2002:a05:620a:254a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c389458e23mr817188885a.10.1767953707045;
        Fri, 09 Jan 2026 02:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9on5U3y21CcX9YejXMliDvFoINV1is4LvnnTNYcp38uzjMU928ZhdCqbIX4PU5m/DU5Itlg==
X-Received: by 2002:a05:620a:254a:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c389458e23mr817186685a.10.1767953706597;
        Fri, 09 Jan 2026 02:15:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511085sm1057781466b.46.2026.01.09.02.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:15:05 -0800 (PST)
Message-ID: <701000c2-11c1-4690-8d6e-0ac79572cea5@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:15:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ef89318-5fa4-47f5-8027-04a91656d81e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3MyBTYWx0ZWRfX3yg7x1ngO62/
 M9wljFI/1TzfHHrPeCJy/lH7vVmlqKFsoptb6dFWNDin+gcf3jitlNd62+NpvseytbnyIDW5cTB
 dg6q1IY32glV7pXiuYV+Ig/MG6Ss3hBTIDpn2YZBGr0chbKdBk5gw76t8snkB4PTyp/PW0VNHCJ
 E5RAAnXjgjZ6L2Q/w8UJU9pzpj0XJiBUKvwuLVRK/xo5cQU9zJUIprkdUMniNqmYexRpFXABRCD
 MeubHuW1Lwy8G5B8MIzKuQ/AVfX9BHkH+uizZ7ugsbZHDr6qDe80xYafyogKv8C0OLtTYmPsFEa
 IC6E7LfqyJU3GVl3ZCR3C0fExBjz292njsSpXuiTJtsL+W8EGC0c47Rvvyf7nxJCUxBSwfy4KVt
 MfRU78G+6mLivxD0OR4TzI3K5VnTDdLu4WEE/IcNqsEVgIwmfaB8h+LHRd8zfWYMR2ClgtwhDEM
 ZJDaWwICalJDqjFXPxg==
X-Proofpoint-GUID: BkNaFOkpkYTviCcBf-tB3yhCw6IeuVqN
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=6960d52b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P3zdcL2LA7wxMbYDQFIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BkNaFOkpkYTviCcBf-tB3yhCw6IeuVqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090073

On 1/9/26 9:20 AM, Neil Armstrong wrote:
> Hi,
> 
> On 1/8/26 15:21, Konrad Dybcio wrote:
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
>>
>> Patch 3 should really be merged after 1&2
> 
> 
> While trying it, I got the following warning:
> 
> In function ‘smem_dram_parse_v3_data’,
>     inlined from ‘smem_dram_parse’ at drivers/soc/qcom/smem_dramc.c:380:3:
> drivers/soc/qcom/smem_dramc.c:216:31: warning: iteration 13 invokes undefined behavior [-Waggressive-loop-optimizations]
>   216 |                 if (freq_entry->freq_khz && freq_entry->enabled)
>       |                     ~~~~~~~~~~^~~~~~~~~~
> drivers/soc/qcom/smem_dramc.c:213:27: note: within this loop
>   213 |         for (int i = 0; i < num_freq_entries; i++) {
>       |                         ~~^~~~~~~~~~~~~~~~~~

clang didn't seem to care..

A (really grumpy) solution would be to add:

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 017bb894a91b..dc2cd7e13b88 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -78,7 +78,7 @@ struct ddr_freq_table {
 
 /* V3 */
 struct ddr_freq_plan_v3 {
-	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3]; /* NOTE: some have 14 like v5 */
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3];
 	u8 num_ddr_freqs;
 	phys_addr_t clk_period_address;
 };
@@ -91,6 +91,21 @@ struct ddr_details_v3 {
 	u8 num_channels;
 };
 
+/* Some V3 structs have an additional frequency level */
+struct ddr_freq_plan_v3_14freqs {
+	struct ddr_freq_table ddr_freq[MAX_DDR_FREQ_NUM_V3 + 1];
+	u8 num_ddr_freqs;
+	phys_addr_t clk_period_address;
+};
+
+struct ddr_details_v3_14freqs {
+	u8 manufacturer_id;
+	u8 device_type;
+	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
+	struct ddr_freq_plan_v3_14freqs ddr_freq_tbl;
+	u8 num_channels;
+};
+
 /* V4 */
 struct ddr_details_v4 {
 	u8 manufacturer_id;
@@ -201,16 +216,11 @@ int qcom_smem_dram_get_hbb(void)
 }
 EXPORT_SYMBOL_GPL(qcom_smem_dram_get_hbb);
 
-static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool additional_freq_entry)
+static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data)
 {
-	/* This may be 13 or 14 */
-	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
 	struct ddr_details_v3 *details = data;
 
-	if (additional_freq_entry)
-		num_freq_entries++;
-
-	for (int i = 0; i < num_freq_entries; i++) {
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
 		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
 
 		if (freq_entry->freq_khz && freq_entry->enabled)
@@ -218,6 +228,18 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool add
 	}
 }
 
+static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
+{
+	struct ddr_details_v3_14freqs *details = data;
+
+	for (int i = 0; i < MAX_DDR_FREQ_NUM_V3 + 1; i++) {
+		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+
+	if (freq_entry->freq_khz && freq_entry->enabled)
+		dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+	}
+}
+
 static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
 {
 	struct ddr_details_v4 *details = data;
@@ -273,8 +295,7 @@ static int smem_dram_infer_struct_version(size_t size)
 	if (size == sizeof(struct ddr_details_v3))
 		return INFO_V3;
 
-	if (size == sizeof(struct ddr_details_v3)
-		 + sizeof(struct ddr_freq_table))
+	if (size == sizeof(struct ddr_details_v3_14freqs))
 		return INFO_V3_WITH_14_FREQS;
 
 	if (size == sizeof(struct ddr_details_v4))
@@ -374,10 +395,10 @@ struct dentry *smem_dram_parse(struct device *dev)
 
 	switch (ver) {
 	case INFO_V3:
-		smem_dram_parse_v3_data(dram, data, false);
+		smem_dram_parse_v3_data(dram, data);
 		break;
 	case INFO_V3_WITH_14_FREQS:
-		smem_dram_parse_v3_data(dram, data, true);
+		smem_dram_parse_v3_14freqs_data(dram, data);
 		break;
 	case INFO_V4:
 		smem_dram_parse_v4_data(dram, data);

A less grumpy one that I'm not sure would make the compiler happy would be:

diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
index 017bb894a91b..3653402fa70c 100644
--- a/drivers/soc/qcom/smem_dramc.c
+++ b/drivers/soc/qcom/smem_dramc.c
@@ -206,15 +206,16 @@ static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool add
 	/* This may be 13 or 14 */
 	int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
 	struct ddr_details_v3 *details = data;
+	struct ddr_freq_table *freq_entry;
 
 	if (additional_freq_entry)
 		num_freq_entries++;
 
-	for (int i = 0; i < num_freq_entries; i++) {
-		struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
+	freq_entry = details->ddr_freq_tbl.ddr_freq;
 
+	for (int i = 0; i < num_freq_entries; i++) {
 		if (freq_entry->freq_khz && freq_entry->enabled)
-			dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
+			dram->frequencies[dram->num_frequencies++] = 1000 * (freq_entry++)->freq_khz;
 	}
 }
 
WDYT?

Konrad

