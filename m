Return-Path: <linux-arm-msm+bounces-80734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E901C3F5E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 17EEA4E83EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A41B2D738A;
	Fri,  7 Nov 2025 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwaRH2oD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csrlCJx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA712AD22
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510579; cv=none; b=Zhd7UNKkGys9q70S/kG/ck6BUHdF74JLrG1p2datLz90zGAmBwHfY8HF4nWpWeeDzkfx4iVu/b3Q7Gu3Iry7WMog27Bxk0za/yqx5lbRZWhtpL6Sgxld3vcfhsmu2nBT3O31T6KI9TYMiCb8I9dS/iSwmXNmtuUnHmCJ/lEnoY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510579; c=relaxed/simple;
	bh=oih8H5ITFiYWo3oxH32M04ZFkQkCCAn+ReSdhjKM8Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnLclzLMhklhWAL3WLtgQRnqJrBUNEg19Mxjxe922Hd76Xmq43oHkRoZboqDjhOK9xqya6PSeLbJX7iUbw8BNEex0squU9j9VOHVmTGPgchxqIvWj0JmST1kYNhV2YzUhYRipEULNms7R5F98SyEd65Rih1Ps6O3eARd2tQErgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwaRH2oD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csrlCJx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73NPE11866870
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oih8H5ITFiYWo3oxH32M04ZFkQkCCAn+ReSdhjKM8Cg=; b=mwaRH2oDv2CcoJMc
	NA2l5w35BKpHWBS13QukdhhKCcWkgVLHD42tTS65+/EBE5Z3E+Shhze9iEIg4+Gh
	lcSZYR1fEjaA55cbTt7py5LqjmoK3F23eruCUGy8o+1zSuHHYRH9pfOW8Gvlzo5V
	X/TJthDRC+KfBygFe4dP9veAzKqFb6M58JjxPAkZDor+uz7JBu8C3wc7ugAeQ8/3
	G7HNgCLseSmTyrwba2fTrI0YO0fDk30J5muTHQO/cW/0BLHlR2SU4zksoQNIbxJv
	6SlUZhiNonu0OEpOFRzYbHZLTiHkKfwwje7DDHG1eyD2XG8cmw89beupGeps1C4D
	Xe0BgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta14d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:16:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b86d977fso2048231cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510576; x=1763115376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oih8H5ITFiYWo3oxH32M04ZFkQkCCAn+ReSdhjKM8Cg=;
        b=csrlCJx89eid+UjDO/NS81c8lxbFLTX+iwX0gc8UO7jMnSzWH+y3HhVzbD+nNz60z8
         RnhZTDusmET46k90ifBJKzJBYgw2gjM334aglp0XenahoAZ/skyskhaf2vA6Tze6AUUa
         w2nK4MicKpyd9o6nX5DSrb19lBhiKJlQptMyXHeox0YW9jeGa1w7KANXAPTbgdHbNqKv
         yMzcGCyOp7SuUgVC9XVHJOmJ9w7kusdq3FhLTKonLx4wX8300SVSuaUyv1H4YSWCe2me
         UyS4NqriBWyr0HWil5lxoenXRVaxvkYA6SWB72Rhwzbr2/AhgiWk85xaNRpqeuKtUEUl
         ZCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510576; x=1763115376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oih8H5ITFiYWo3oxH32M04ZFkQkCCAn+ReSdhjKM8Cg=;
        b=ArJod09NayWcfffNENdy9Fd8hUslu4VGTn/q5FunZTroHeH6rZwB7ZITg7ZVtz/z/3
         ijc1cwd8JcW0JH6WT94dfusZY+D+YZPWKA6OZfW+9UVNtTEs9ox+TNZdopluTMGUBNKq
         LDc6o3XpLxsgQ+Vt9NimM/AvjWkotTOhpB/lIXZMa8d3LYKU/f/uj/1lj5pmHow988ls
         V8OMRGikqj5TUJf2SmIxMklfCaG64Cjqzqd5b5MB7r6NEXVLuVL7C6kbpAZMRDLlkAEv
         Mxz003NlXvPVEpspoewIHOCf0yXLRacrNLW3bOmkachGatmrp6QdQgFoIiaJLhZwOS4A
         kWlQ==
X-Gm-Message-State: AOJu0YwOkvlo5Q31Hl7jnky11YCO4TFbeDPLy2FEo+ZPm39qDkRjowBF
	lXhKkKQVQlxiU+DVMJygeZSXtaBoOVuPkQG5OTmh/FiR1gBxfaDbkPQODhP7SEm6MdsQiR/7fVG
	yiUj50Xng/71fzPI6PnElx4LRl5ESl1QE+HvxEYS43M6k6SaYei45s+vpN+kkCk0RqprY
X-Gm-Gg: ASbGncvLx359fgeZ4Kqpb79O+ZEPHeUaiYXg5TuiY84pzbUvk8f7V06Ib5JU8ObnYSw
	7LgjupjGDjGdeUYpTSHK5lSefOM6nZTTZGVtd5NqJsR6LefHplZZdRg52z+1WUXzoSl6IBSPv5g
	sggv83xCeZQp5DpR4rL+9VtvVzX+IyBlyI0bL9II+ceU+xLeoKpWuk+9SMCxdwbM7xoUfH1UKx6
	Vc1XI2gRNF66xS0li7hSmgGnNwp/vV/O4c4Pe5/zw1U9A01pJx9WhCdQkStHKGcLDYGi53Q2WnN
	4L212OoO4dLT/qo4Wnl+wBRFvQT9L6fVwAsmxY8Lgt0ZL/Aki5Y2unVfKSkqbBSf3mPgY6pcjIv
	tobV9Q9L/WkjxzCz4QbcEFQiIxDPQJ4ocFeaqsugZoaV+pjM1AQvULsAx
X-Received: by 2002:a05:622a:134a:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed94a844f6mr20123381cf.12.1762510576480;
        Fri, 07 Nov 2025 02:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd62pbSfANF4jkGmXNMcRw44lphW1MAMAqba3HPT3RotQ8f1uUGg+2M6h0caCYjIIGfmBDzQ==
X-Received: by 2002:a05:622a:134a:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed94a844f6mr20123041cf.12.1762510575918;
        Fri, 07 Nov 2025 02:16:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e808sm3677971a12.35.2025.11.07.02.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:16:15 -0800 (PST)
Message-ID: <5041ed01-c0a1-4c43-803a-9b2f7bf1f56b@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:16:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-9-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-9-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MiBTYWx0ZWRfX/7sTdb4rHJNK
 IXzxualjOqhTXKTFOHKH936Vu2qsZwkDqOCIDL5rNn/z3fOF/aQggIcuzQN37D6AXGd2dguLVi5
 2FL4I9Zkp9uADhohXU+UCzgq6kGLf0XkAPbxr8FPa+kLekhISZX8pOvfa6gLjvIYhjCmtg/W4qM
 iczdmwyKhzec6Je1FmY9GyzHPbCu+i5kEw8OAvpvibWeNhQOilT8w0wBzEvNU95TEu1OY0E/vM3
 buLzT5/yQAsO4PGyxeSNYqtv8NpEw/T6h9Xhlwg3OTfsuOtjkstGopxvpL6WRsp0HShPnhCQxLC
 7mqlz/CmIuH6ku4pPNcA9RoYoF/ceZBGMbiIdRwz9EnyzM9D2z/JrHLRPpa0gsBpFsD+EtfSrMF
 F/LyuNgwQwmZ2zTUdEajA6IFKIwweQ==
X-Proofpoint-ORIG-GUID: EHrvNKqv0sNhMk0dTBE8ecayRSyIywHU
X-Proofpoint-GUID: EHrvNKqv0sNhMk0dTBE8ecayRSyIywHU
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690dc6f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JpbW_vvhGqlY3ahWJhAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070082

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> Simplify qcom_scm_pas_init_image() by making the memory allocation,
> copy and free operations done in a separate function than the actual
> SMC call.

This would be better supported by saying "this is prepwork for the next
patch"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



