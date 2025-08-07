Return-Path: <linux-arm-msm+bounces-68046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AFAB1DC5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C61584DF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D7C26656F;
	Thu,  7 Aug 2025 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz6yMIvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2A1DB127
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587119; cv=none; b=rUikkhP2DFyS1a75sV4bI4Qqiyea92ntnOSXhqZyRKz99hBqbZ8EB0gv5hdG9tQ6tUAB5bKJSOfJD7tMCmkCKBq42CF2djKKhZrDwtKQ8zol5yvrb+XkKMmGkeqwG7kH/WP2gqNBNfXxo3nU5R5uC4HTt9a9jRGeUrQwga/SD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587119; c=relaxed/simple;
	bh=ix4wfzIRuANwVsXaP/80+i/iUtqcmQAOhg9cFDtjiV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1V4WxZCRIhv85531OfTNdCINbvIcV6NtIownnoy6IPTDtoD0sgUZWjrGzLCFffsbvlOF8fM0tC+eJj6EB55KghyM4c0m4DEkSkkMse9uNaHAYBkVPZsy/9lO6yslDYqZB1GOb+83zuxvKQ36tJIBd9W9mI0wAOXZ3hFz3snyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz6yMIvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DBZd020477
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=; b=bz6yMIvrF9kz4XD5
	JXh1ZKRAyPHsw7ms/x/AUct7v/ZICwoDIGWBEoXLH+y3rHmxk0r2ynysiQgGvbK5
	M1NeeLuLYhvy6mhM3394k5ccr3MZ6tgu54fwlz1o+LVJbRoRdvMbRq4zz2hqrQXc
	Klmc41t1EACwREobXBIWgMsIqpIb2TI4id8u3aWiwszLy8ISiEzfp3e2gSL2xCN1
	SlryyDV+M26I+zlwStMSAxdGM4AG8wsFy8c9HS18M+Z4ZGYqD/xyoMy0z0TQ+j7o
	mhIRzysGp+bw0kpmFtT5fTjzrl5jsOVQvzLOOdXJIzeEYIkATxpAVsyK9rYrtHr2
	ij5G1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8f2u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 17:18:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3215b3229c7so1404139a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587116; x=1755191916;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=;
        b=BBPJD3QDid63ympLemKgNZh7QlorVX+VBv47GGhhsOgYXvYEQXtB6cM/pD6i2Z5kGX
         hb4V3n+t3Rzkl9JoAMD2V53yAbQvU8z+qA80ZbgPLWYptwErBSysRoRNCLzmVdEP4g2K
         TTZeXwpz8euSYkqHJp+/0VoZrO52CSLKY54v2smm2g0Wurq35P6ZTuogbEMRAbPm/i1Y
         KLwecKnzWXGUDTW0WDs5ji2eKH1MPbV2vU0jNPtZc6On2vaQ8uc0yOwdGFF/4v25r/tO
         ssUCmG0H/d+XpVY7XTBEOKV2KtpohZoiiXR8ZsAeG7S6gE9Z4/jowA1WZ8VasBzY6OOU
         M/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUGlJQSL4bd9g2jM65uCfZs+MMAjGVj3BvPsyhL4purdTtCkLZNrn3g5nUes+7L0EruGtmw98jjFfO6YzOe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31ZML88KDQ/bGKbYkCYRiiuXNS2ibEW1Q0pfM6z5y2HwVb87p
	cO92T7I1n0s8+yV9J3C6BSMCHrKMTpTE3ClzZoS23w4iPUbZ+4zVe5sOtBJ753nRy/4DGCmKEj4
	GDymOpxuTCAnpmtN1W3au4WfnKBqywJvhtUcoU53Rpog9fJ4nBNti/4b8vH7D16i+b8GL
X-Gm-Gg: ASbGncunOjBbnaKgep/fGbZ2Yad88BV6F696VTHq2g/q2TcwzWa7yB7ksd3hjsl262z
	F9fj0RRO5nc44ybNl6TAObLqtUlRO41NggL0ZJ3t7sF7u71i9mUi3Ug5lnE97vgIbPH5mi+STd7
	3lXAdQM0WgGuwj07A31R1VOwPnt6x6oNHADyQCBPkPPy0yjuNJcTEc+gBM8QQPnZBvq1TqgMeWd
	kkRxaV70jirXROsEuHJ9Pm21pXWRDZ6ukDGWcSLA/SF4MYfyWo5XYoNsRaWAjsNWAJNzZEPpY/O
	IMx48YnHOdfR8MEHmtrGWifntW4Xk2DniaOjHm69c0bSIiZjoCFwzTfnP5uIGIarFRxW8xR2mbq
	mIjlHHwZlPkDggOmnlz0=
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228080a91.17.1754587116447;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSBIxZMtyLHjJ8ZZPSYmQQchctU93wo3YtjIAb6ci0mllkfGZXT4TLleL1LzuppQ6KSZiwg==
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228044a91.17.1754587116004;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129c8cfsm6088656a91.34.2025.08.07.10.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:18:35 -0700 (PDT)
Message-ID: <9b1f4ea5-2948-4807-a4d2-0efe7b672a4d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 10:18:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: izm6LNhr35TbRjh4Siqz0WignwMdQean
X-Proofpoint-ORIG-GUID: izm6LNhr35TbRjh4Siqz0WignwMdQean
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5Zkt7xy+QJeG
 lyAA6UEzUnQWiG3wHTzC32AidhZ63Myk/YC4D2NFG/UXBdRHTlFHCegv+o+uydxn275LLh+utx3
 YkMZsN0w6cTAK1prjuoaSSvnozCi6f1INyiwgMYjbaTm7qxDW6o7+9HC8JeM04vU9IhJzQu1eGe
 8M1joVUXU3XeiwmhLTUZPfk+vo0vGmYnMHcY9sX2d9+BkUdaq4V5rUEEew9gzrPPf5xlJSRiU03
 RDqJalUDjrtd0P9Gi6xIueGwQpyr1N/6SrnyNkN+aFhf57gCfLR1XnUi74NIrNOF8pOZ3xvhP6t
 xeGFZLdSEGlH2tYBauOFm96SAVE6B3qDlnYqVhuGdP47Z/3mRWt9hHIqR9+rwNsdpMfuZmvNHV3
 Eyt4K4jj
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6894dfed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/2025 12:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


