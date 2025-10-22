Return-Path: <linux-arm-msm+bounces-78259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CFBFA2C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEC404FBD10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9242EF65A;
	Wed, 22 Oct 2025 06:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbT4OSXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB02EE60B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113281; cv=none; b=DIq5Wl1axcgFKj7fniQgUHHLemzbxrpJeA0HbJySL3WVd/mQUCHct4cNclOACwwsCk6O0FLrsWZX20Otc4or51KeaXw9Uy6nsbMNxynqJEjyiyb3W8P9FxsOVwePz3g0ZK/h+yXsBIByEBH1v7lk592DsT/7QclPVq0GuKL3hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113281; c=relaxed/simple;
	bh=Sglu3AHsdA56DCF5eQWWlJB8wv7B+UPJmWstntDnA1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azn90JC42lWc9VxyTSEnOOp/eFw95o/DLlj1VVmUukNdrk86t/QAXdnKE3x/5HszO7bcQzRByLAuMsxtPdUVtJKeZMxnLLG/Yp/oUcgvqqKE2M52aPmphL6Y6eZicxicQjje1U5DPfuqOlsOwCFjzWFg3P2DHOAnJC70//Fi+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbT4OSXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LNG2La004127
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFeybT/HfJvpZ870zvEnUeOgeVUn3AqbfdXfhS0xCBA=; b=bbT4OSXSVy70ojXg
	GZLEUlW4Cd+rDP2onY9nC20OE9A4Z3PskmSXaO09KYOwqeugQjj578EncreSYzlV
	GC7+r5aQeeH5h5WKmUU8wRkcPW5GoOT+LzQJ35mFa7Neih8SKDTiuSErYjkXdgvB
	kTlzOCNJxr1Y81o0KmFSIfkH0kRHHosf7U8m9q6dh1+41RQKeRdIc17S+fzl1/dI
	3WhQsdi4ansztVJiWk7U6/1/mcexZTdVMJaQ+m3pKIKzRhHol4uvSM1TRTR35qcn
	3itZ5s2PjSJjglbe9xtW7qoJix1ov6z3GK+S/xyf0FiZLFX8NOCD10WjsQ+IbmO8
	8GKLbQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkps8xwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4110so447224a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113278; x=1761718078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFeybT/HfJvpZ870zvEnUeOgeVUn3AqbfdXfhS0xCBA=;
        b=v3TEYRBcnMoAlwNp44CcmwlOCE1Wq9sV/MysZyGlJum07236ReXjAaoRIvQBsIAK53
         umCnLvSKM0V3dLw/mK8JrKeuPUqfsNM0UU8/eXLctg8kcQiBJ8+4V8yj/CnczisosLlw
         +CA/9eB9VZag5cN5WVx4hmvfVKmvk+royYh5IiwrYiBBtaIHPP7IfGvKwFJohsnpGMMP
         sc8mGpfVYZBunaoVGO8IMUZ4qT6i9mEY4kCD/E4x9cfpezW+Xn2viTAoypDQEQDw1Khc
         OaPH7uH0brggRVxwJs5JGNY9iLw4OeaplYX90OK8xhsEmuV9ey/f2qwMl34HrmOYPS5w
         rkyw==
X-Gm-Message-State: AOJu0Ywa99w6KQWMLGoZiSiqronZVn4hNYqV9A+zsQJq6gpMQjVzzWwu
	4ZGW1Io0/bzzPDithNl81FptmqxJXix8W148laZgdmFJ59l61/nJVvgAyeBuFnH1I/d4wWgxjZW
	OJ8wdLtUCZFe3+NC+y6ZGTYN8s5gj9FLEeAZiEnY3J/TXTxuZDoth6MIF4Ib9C82Mu3xs
X-Gm-Gg: ASbGncv7yaB/YMjwXkqwJnRKx2/1m/emQogDHptll8I3iRBXD66sJVlcgiLoaiEMGwc
	ZJMX4h8jRe/hD361CTrioF3k7xMhF0rwzMSU8iv4fxy97c0vHrqbPuEg1Rr5721Ja4XMbmMMJF4
	ic4EBSbYEQK2Z6WS1xwwdcnk9qh0iyR8bpB2p85HCpQ+xgXaPJSWgi/jTbrXi0Lq32/PHmIarRr
	ZQrb2JdjbmcpqMLGg5P3ITzp+l3XOGMtNFY1+xM36KACYhLR+FssmWGrgt+CyW7DXP/dsDjiXlW
	eFwpRTz3onIguJQ4DIuARO39Dkw76NWAo4Bueez6XqjL23IY1hHwAcduwmaTvKxdHWwYZoRHt9f
	PkZmmG8ZIvnNzasPVFEEKjvn+2gjVpntxPg==
X-Received: by 2002:a05:6a20:9149:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-33aa6879675mr3426055637.12.1761113278337;
        Tue, 21 Oct 2025 23:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/8gASKFn2EzrOtCVC4l7qI8001cLdClTDmvQxCAmZe7gdni7lRkjnTKbSZfKe6wvNF9YvPw==
X-Received: by 2002:a05:6a20:9149:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-33aa6879675mr3426021637.12.1761113277873;
        Tue, 21 Oct 2025 23:07:57 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3f6c2esm2019810a91.6.2025.10.21.23.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:07:57 -0700 (PDT)
Message-ID: <c3a468be-39b0-5c3d-e4d8-9e45f3f6ae22@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:37:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <579c8667827cb1ac5778b48077f4f84e875b69da.camel@ndufresne.ca>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <579c8667827cb1ac5778b48077f4f84e875b69da.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX47GENjtWReMR
 D5oIQJskjP1RVIwK87HAzYVdq1plABf4DL3+dwflOKsp0InK9Dt2Wa/5pyyj8G7oLjiMZKmQBkj
 ZqVuhYxVk5LErqhTf9q+pxlURQeVNkvCbj8/W3TXOf/UkChTyGMEdEodAbX78UEll1TsNL4CG/f
 AKSZrexLZrl5e2qvOZc5zwTQ/ejkvRHOz/LprTAvk+SkU0msOcUC3GIg6mekxSi+/kA0Y3yUX+o
 M4Gd3LPPhP50ZGOb/YFRAcpx2rn5rUSiBDg/ntMCztwWWj9sgw6nLe/wZ2nll4Lu0srQU+jl/T3
 sZCy2kuQA8iVzXGhl8SPp+5sYmypwAuPdgb1iKROwiJ22ap6wXFlatrAIYAWRRcHmTeHc7q5rnu
 yJ9FIWx4AGKihzfmTRl4W1ELUHyTdA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f874bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PfT22KiLOBK7PLsoD1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: i2BkmBLFm9iwceeqajM8pY0MkcP8Nc_7
X-Proofpoint-ORIG-GUID: i2BkmBLFm9iwceeqajM8pY0MkcP8Nc_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Hello Nicolas,

On 10/17/2025 8:06 PM, Nicolas Dufresne wrote:
> Hi Vikash,
> 
> Le vendredi 17 octobre 2025 à 19:46 +0530, Vikash Garodia a
>> [  350.438406] qcom-iris 2000000.video-codec: invalid plane
>> [  350.447079] qcom-iris 2000000.video-codec: invalid plane
>> [  350.458821] qcom-iris 2000000.video-codec: invalid plane
>> [  350.465860] qcom-iris 2000000.video-codec: invalid plane
> 
> Just a highlight, the driver should only print stuff on default log level if
> something is malfunctioning. uAPI miss-use should only be trace on loglevel
> manually enabled by the developers. Mind fixing this up while at it ? Hopefully
> this will be obvious to you next time you encounter it.

Agree, this specific log should not be part of default execution and more so
when this is not malfunctioning. I would remove this log as i see it can be dropped.

Regards,
Vikash

