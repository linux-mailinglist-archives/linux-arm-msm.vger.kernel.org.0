Return-Path: <linux-arm-msm+bounces-68955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0DB24688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870171636BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0315212567;
	Wed, 13 Aug 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9CaoIbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF13212570
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079255; cv=none; b=UMIJeeOnuYaxHdfs57+IzNXkrZBmZDpdNkSe7/+2q/n3oREhYMZDK/vvYcBEynlPgnjnBu62R5oKPgn/Wdyo57nMuecgN8vQHJmmoFchX7/+skShavEbBNRe98i1xr7UcUhmXyT8f0EdTraRd8Ia1KeiATQPoHqCHsWaU0hYqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079255; c=relaxed/simple;
	bh=cBywqYQ571JjXH/CFVXtPZFVBnz+yE4lfUMvOMd0qMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHDPgTRtfsSSXrUEgilyVdLOWmkttfGl/glM+EytjE5PBvxslaRLzgL9/mGRfnpI/cLFYjh5Bi3VFHlNJFEk9H4hgsVOX7A5NftbbIGUgCB2kwB71r+HsZH6ftzO+ktrZUo9DM5usCuExyAYeXOzc2Ye0tBBz/HtAnbJC5++uBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9CaoIbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIhD020458
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=; b=N9CaoIbLvjII5iGW
	91H0wJPvVuZVgOQHfDedopcJWkBiXmu0ICOQy8BWlNAMtuIFn76O9zsijrMcXWaR
	nGy1Lc3PT43fWeQIRxtPT/wUiLltdupUp3wNKpr4D6+EAXiXh4Y8inhd+D0CROS+
	QvyvLgiKqlvKBtRTXqbV1cO5t0dB9S9+v8yPwFXbTTPA6MgYB2fzMCuUCJvhmITS
	jVdz6J9Z8oSnKORIzJeeMhKraWxKcjqxlBdua9wfi2YinhduTNdaOnw1ZsZxFm7E
	EXQIckRprZ49SAJVNw7MUW0hmGfMqL2vtakcjWUxi7WJVzJI3YEFLDrBS1JssXgF
	zzOp1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9gdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:00:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b08f6edcedso18596221cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079251; x=1755684051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=;
        b=X5fSHlebrE65RNx7Gro1prtsA5vc+jHXuPsAa2ENQg8GE9XP64KCXWz9vYUo/Mnj8V
         Vb7lFWuNiG49EaSmanfagjzk6jzfIJ21rPB0LiJwNZjfq2P7uz7d8QwYe1XmkuntQmiT
         u4YXtdiOAYgQ5Z8eOJfbjanLBm62aaSqJG+zokv48EoslhzsCcs+QbL3grsd1yYt24Ig
         7ci9u9xrGCBORWVdNm9GEp0ESWIBJsGjLcIkNS1u2epn6fhDsZrERlLny8/oEeNQNc40
         6+JFZRls260AC8Ni44tf16LC1g5g3jZu+QXFQXFCrgBXtcQTB0dSHl9tzWP9YFWAOwHH
         FPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXL8ozTHs3KpkM1dpPLu8XcEsFQEq2YLupIx2jYNRgrpJKbeZ1LCzHUsfO/QhCYaCWKklN8AY7iCMaGGSR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Zo60Y5sWdJrt2VSqXP1NBjLzb6x+TrU1s+48Rb9OhoLMoO+i
	/++spr/CpELwvPB3H0cG0w60DajclEix3byyoKshoF0GATBjaZQrxJ4csv1NmitHqwLz2dEpRkr
	r3ewVyYQpFLQS4pHYVdvg00tUcBmwmv0uqkUbkZJWIrUbsL12jDuuUJQ9WZ+xyHhEsVEm
X-Gm-Gg: ASbGncufXx8g3byEmPV8DMoHHHpQXuMoOdubP+fNpd/E9QkM5vX3yGp5mmP7Ac2X/IL
	PA2bWsMRecIG30H8BAHCbuLwwe/FCy6+CZxCQzUq9CAivX8Iur+ayP6ARuy1TRZilLFqJ843juy
	vsyDHjxRlswnTiAzJAl+sKG2d7hFwQ+NYfXEQr1T6r5QVLB5AFI+s2WxMabH7blzbIYPnZlE+i0
	WHhu4ruULxp47bJ9RoC6i4/V/jXszO5GPZObuOC3KVZ1/QuzMcJ5MnzQjXSk5zO1S9ImU8Uwdsb
	bwtFStxTF7ynF9LTUkujyx+E2WXdw2EksvDasrvkCpFpo8ja99Hj3EGYky6Se+vRpD3ri0R4Ev3
	hc2UmQ6QFyagjQm4uAA==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b0fc6c46d3mr13967011cf.4.1755079251189;
        Wed, 13 Aug 2025 03:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmTrD4ySjMqSbwhalzXJcsozDXyEzKvaYMIjrNiNP0RSpO0suJx9JL31ZtBXBXWoPTlWVUaw==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b0fc6c46d3mr13966501cf.4.1755079250541;
        Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3375sm2366142566b.41.2025.08.13.03.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Message-ID: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXw89r2KFxj6v2
 BdhCnN4t7p4COUqB3V2io4ZwXyptNF8PpBStreElHoCvn93U6kzWBOpy8SX3XUNy7Y0y4ta1C6N
 VtxY7G0FpB4AVFnIwo1lmSht5bnaJPsByxPpN1EJgcRI2OC/FBGlZ1xhpqVrhOPO4jbJe5hCq6o
 T/wAM/+SFZC9UUNjcCIBfSwb81StTfa6Wlmb63BkgoKijBfRfCxewqDAtwOSIG3/0KtRYt9IKhF
 KQ8Hfshq3y5ZN4logomYfZFRBaoGbBf9S840o2Fm5BDjcq07Y+OB47bDqlHiG4nW2UfCJJBYUFQ
 mZ62jlekvn310BpY8A0TnK/5eK8aX2AIhPHc5jr3iRpJdHRc4/QaXfxBMT7xCQj2qEhGWvTW0+g
 rBwbQo+d
X-Proofpoint-GUID: VlKYkCHlXYN7AcQmhq75-c6EL7hJ1-SA
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c6254 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WNCivIMphfMWkbBb3CYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VlKYkCHlXYN7AcQmhq75-c6EL7hJ1-SA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Enable userspace to allocate shared memory with QTEE. Since
> QTEE handles shared memory as object, a wrapper is implemented
> to represent tee_shm as an object. The shared memory identifier,
> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

[...]

> +/* Mapping information format as expected by QTEE. */
> +struct qcomtee_mapping_info {
> +	u64 paddr;
> +	u64 len;
> +	u32 perms;
> +} __packed;

Please use types with explicit endianness, e.g. __le32. I'm assuming
TZ will always be little-endian, regardless of the host OS

Konrad

