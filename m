Return-Path: <linux-arm-msm+bounces-72995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D0B5187C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 15:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31663AC859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB05320A36;
	Wed, 10 Sep 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3WoAPP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED383168FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512640; cv=none; b=LD4d353HPRoiDHuNQMTIq6PZfzCqjje1f3SgjppkEPpsq5C6KrL1Zt8rCJGqnjjT5fLC8csi9vl6LqpVmninob88gx7w+HY76mdh7qXGAoriXs8YaTzf4ECvYnqHAB5R4a6xZv9pxZSfnJMb2d0/ZfAmUDuap4decG00Ab4CRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512640; c=relaxed/simple;
	bh=/wfQDim4ahb6Q6nDJIfOnfdyp76lezfBLoVX/eGVN/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSpwpk6uQ5C64j3ymffFdvpgzQpg/re/SKo93+UG2HGeCc6cymbFRvQcLcyV2+sdBVOUvI8rlW3LnjfLDBEJC5kKrMYKMvQtlRtO+1kjKxj4jgjAtbhiR1DeVtOPHiN/4tzTymGM8g8xT+cyOGxz3IIm//WrrolqebEs5t508So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3WoAPP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgEY4020617
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fJ/7ym1FXsoeacKSkxLjPWBg3p9UzUEwVJxmblp4aA=; b=a3WoAPP2Zo4Nisbx
	ovOxDjIrrUpORZ3g8bUG13XOPuAV2Cn8KtkDRg5PknxvPkgJ8aYOsAS8+41Riwkd
	s1ogfvQgtzGaxpWo/0xMwGZq/cabDK+DOqzFCLqKAXxnMFfkzfRTcEORsr3Pmofw
	6PteGyHzEHwhA465q/9yL7dP1+0o0h2HiSrCWnjsgjTftKC3ilEvB1VVdhG2FV7s
	TrdT71vaiI4d15wSD63aCDhtTKWzKymQudYSmKHfB5TKrVlndQZ91+PHaLcUdHO+
	fl6j0Ud6371/vLoisb+y7ZgCLvAHDEcHlAtTeaRbw1kKOjN9QF7PYIAYEIT5eaqA
	5rUHdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc282j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:57:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b604c02383so17450781cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 06:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512637; x=1758117437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fJ/7ym1FXsoeacKSkxLjPWBg3p9UzUEwVJxmblp4aA=;
        b=GmzIfbLVLRp+U5GMIEauDzn3QgQXh0WPTfGCSZgsnlHGUtlR6tduuEJcJsLkYQT4+G
         M9EYv4dtxojQxzcdWd8pv9xgoQAQNjp6ApfoYgmtdBGqlT1ipiEnaBJnRyFbRsMijNq6
         0xnhV4AXB5jEMihTa0UzNe7unE+cLQEYdwKXbGP16YN7OykMOQl8waE5tC8LODBEjoE8
         ms6OxuOMoHlg2KfO805OBgSYOLLo0ijhikW55BacQGb2+cs/6B52OCmIKDIRPxkkTKSH
         SfpUbfvtvjXEs/ewnNeXWP8tCKzLC7jGADrqxoQD91W1RhOrCZw63fH4eEM3rifTnSQm
         YRxw==
X-Forwarded-Encrypted: i=1; AJvYcCVloTBGibFYh+VqVtgKfzVcBV2xSslsTSHenyWYLg/kP4DuO0NiVQAVpJ/uI8kUHIU+oWCITiza4EtF3IIf@vger.kernel.org
X-Gm-Message-State: AOJu0YwXlFB7WfWE7jWZMyBSZhfMgIFqaHJ4gBD8kzRbWD+VGaUsDHDJ
	aqTR3QKTaGMCdPa8y5FxUDj6XoaaCoJoPeNf8YuOGnQmS06khDyXcKU0XAzNX3dlIbXInGQCvkw
	arubHXYEQnlXYfygBcSmPOhIx198h7vXQtThzVU8amgHML3405KmR+JHRkLe0fiyfZcgv
X-Gm-Gg: ASbGncvW8BzAliAXzTtmDdm3KLCgM68/7Q+yBVjPTuYuAu3aXA2eJV5Hkyz7GssxOJa
	Ouyynr5e2p27mlaTM0Q3jUfksNihGdfa6MQHu//DZWHG54Bh/Rd84HWyazc+2257cmlGHqqVfUO
	L6LFomK+jCIBZmPjoEfRW0+xMXrOxXFLyNxOBF2aWxSHFcqrPmHUx9q818fwP2hLP/yZvDe8DbG
	k+wX8gcYk6Mm+/vr30oF6J0S/bnT7VRgtUkk5KGnjOf0WSni59peZf6VCdB3ibKjCnbV00ONfQB
	Vi807324RGew8pHmuhsYqoyT/r9iVBn+0swBY6c/QUqRsc1OhFN3LKcy24pNGi0d7iNEeJtegHs
	2ilyby/eAXiCvYGWmN0C1qg==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr119935521cf.4.1757512637387;
        Wed, 10 Sep 2025 06:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtPKK5PUQ+h2E5IfRB6yeYQejWcIdFPwadPZHwUcThe6XnDwjitcbDpSw8Cmgn/hL3Cw7upw==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr119935291cf.4.1757512636836;
        Wed, 10 Sep 2025 06:57:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb952sm3333151a12.52.2025.09.10.06.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 06:57:16 -0700 (PDT)
Message-ID: <10b8b0c3-5c1d-4631-9feb-c83d08d619a3@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250910134737.19381-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910134737.19381-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c183be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nxTl8UUStihZDgUTFOEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qE6sNMlSSRZ_CVYhc5i-TT8EtnXjVsOf
X-Proofpoint-GUID: qE6sNMlSSRZ_CVYhc5i-TT8EtnXjVsOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5lXLgdrpKxEj
 Osi+xi+F4TtuwtlRXhmvSDdMSjFKVCLTlQ7PVg5mosCodIRwsCAf01jVEv1FUXlY7ZrExyN5MTg
 LC/+CpMgVERCFn4ewvSGdW94v8P5Nh3iMTIQZd6r7iIj7kJHDIFD8XNHGAAGodXf1C4StsgIDsU
 25gTKYeBFTNscA3S8IPapJhU/QjT4Tj6vqQOiDQCwOlBYAbTNTYCFrfyFegcdkLhaNtDKbyIkPq
 2NivvZ/zENULyD/K1nvb7lOyCO6ha3a49sF6tsn61NGWhupgRtaf1MP04U01B2mA2aPAZ5ag+uO
 b5Gq2RB2CsOiaA6v0xpcbAR38GgkBzekX+3MZvls/gAMnp3azJl8RtCpmDFIBZLgYe0SfRfc15i
 YDNIUyIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On 9/10/25 3:47 PM, Johan Hovold wrote:
> Drop an obsolete comment about keeping the PCIe GDSCs always-on,
> something which is no longer the case since commit db382dd55bcb ("clk:
> qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state").
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

They're not quite off yet, but they're not perma-on either, so I
suppose it makes sense:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

