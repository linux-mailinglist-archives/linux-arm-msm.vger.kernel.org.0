Return-Path: <linux-arm-msm+bounces-83975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EBC9790C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686AE3AA298
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D144931196D;
	Mon,  1 Dec 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isHcG5sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEEYB7c9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF49311951
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594758; cv=none; b=RWZsdT9WZyGYsPO6PrX/ZcjAnYUxE2nosGzV55sxV+6t4a1zo+NUSWl10HDWF7S/STnPYuXaSIZYeEKZ1PpbXdsKERCuhH9eC5+NMVM/C3QvHxAAA3uAkOFShXePDVTy+QAO+XdC/Jc4Lwrj3sA00BKA1wjkrcEPpIC+WNPXtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594758; c=relaxed/simple;
	bh=OHQpp9FMXyFilwzo2EUg2iLzMctD4LPq2fjbUQhYQcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA1xmnXwW9qV0l+WlgFPqVuZmjVme5nV0kAj8lNqrVuiypL644SQ1TyUO+O2qEtExiWYT/ksSiC69ihdcoacqhBxEdj07JQz+Ff4XZNuy2GmNYXhIx91/lRm/7gpbsPPEOdz3hiHQ566dvTE+qd22b0N0gR+JLny/PxpXRtrUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isHcG5sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEEYB7c9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18vfZw2800646
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cm2O7hybZMojOh59A0MQf50ciY/skAE7bL79tnW+jjU=; b=isHcG5skAMXuYGlm
	818l+uF4Se/cPG7uNVvAkvDmEsD4iQwHC+2zpMPnInwOiL6B634dlsB7sSskZU4q
	NS7Tcbw19wtBkR6kp1G1ewejAnOvr1dxkhE5vGlzJlOY0K3btf8yYPOSuP1tOfv5
	xHFNBB2ONs6j30uNutbHatfAXSWpy0HB2OiaMqtAeCOMlRNg3sA5PEU81+90p6PR
	i5bHpAsZXUDLOpQaLbuYcy2cbxUNZaWrGHJmIDtLZTojTjaJSrSOpUIGWUPFUFol
	OW5bmNyEm3yLAsrja8jjfY912w+1PulQi4JI0sbZCLy8JM6u8heKk6YMZpY8G0vU
	x6vF+w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt2ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:12:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-935163478acso91780241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594755; x=1765199555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cm2O7hybZMojOh59A0MQf50ciY/skAE7bL79tnW+jjU=;
        b=OEEYB7c9na2TadTbrF9OEGU3zogJUlACOfNhqjFCFtmaZBOb+VF0jUgyKhJvq539B+
         CjxwC+lPU+GMBPMiTdAmBbduQoc8I4hTTHy4WbDvaOHcFDxwFCGfXT4q/E5gFFztWwey
         ay/IM39dDQvTVggxjk4igbxIvvFIZ8c3SFDTAYg94txOaYg/H2ND0WwB0ZRk5sfFyexn
         m/zDiBiTg6w/pvVIcXGeGj29yuph3ppxS4FJi77JCFyjYbaJDxZ03ceK+LUxx82L23Xf
         mlS7Rv+93g4MPEcfJx/GoR+mWWmmj5Ue9F37VDWjuMRv3Hh+c/fVa3TqrYZEnOBe2U95
         mP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594755; x=1765199555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm2O7hybZMojOh59A0MQf50ciY/skAE7bL79tnW+jjU=;
        b=aHdRPffDpKHHChwvW9QDm/sBjZhA8Xb798RRKfgLMlCG8WFeiFC6swgOOGNpjItKI8
         ghRpAazYiM/WxyQ/zhelw9r0ps48GkxmMvT/u8koQSsfyYCI+QuNr0zL1vSwDRhnhPmM
         26LZEd7fYHC9RwHHTKZnFmRG1UXyEWXcYjiI1/tMW7IY3rVjKzRdZdrcNbDgmFhXU8/j
         0xikLN3KRtmxId3edwQTduxKFgCH1nLy/tU8pfi+oMxzpUkK+Iis86fgpQ3lVP/+chp8
         zdhwEBxzSsIe2tj7UnVylF7lJBvyI/JNIwqtAAIKcEeD3GiYuuCh/Eqp9EKxbp/WFbmx
         5I8g==
X-Forwarded-Encrypted: i=1; AJvYcCUnk3RS7q6kaxGum4NVWf7u2NUDe5AvFhTj4jhTvN4run7qFS5zBwXY7NZBP2n77p41h4s8p3G7Z64McZ4f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmiiff9WKNNGuSEHNhO3uzwtnw9df20bGnZ0Mw+BQZGkN1u9vp
	40vN+TF+0l2ei7gumsxPVi4XD8p/g5Lff+Iu5WQzd96XLisn/nCFKUiA3vOvn5XjgPiZYSR2w3Q
	CoJrjnCxunOvo0eVqt17RJyiRza0Y9yIm1//1MTQsmy6rE8M+o2wWrampV4b9eNPcjlPQ
X-Gm-Gg: ASbGncu/QXjuENBye4FnSBZVKbdKo43DhoeoVNBHmUOk9tX33g8vB334mAR6L0dnaNl
	l33UOkM+CcITd27JxeKiwS3EamhNH70L0MDeFTxP1a2mCQPJjU3aQfM3HXZF4krLQYdlQ/TikJb
	z+hCI0cBsMlikRxox3vx096xepNDy8nFpXNp24uw5Q+H0YmnTrsF+5VfDlwHTWOtv0U3UtOdaHq
	wPFcS5as/LA0ZbSA3N3AmEfjUAYOUwz+yl/FNB2mCAaoKIjnkf9vaKN/Qso66FFP9Fva7KMAEDL
	6UNM59KkZLA7b+JxKGrmC43d3LZlP+k0aJj7mVKp38kU6J+Cz8J9KlXA+eQHNmEAl2WQ/9KMNGG
	9p8v1U9XTZKAMRm1O+S4LUbC8eKCiqasgEYmzQeycRaXduZoypmWPvVAClSS5Z453t3g=
X-Received: by 2002:a05:6122:221c:b0:559:a654:d26e with SMTP id 71dfb90a1353d-55b8d6e245emr8235431e0c.1.1764594755455;
        Mon, 01 Dec 2025 05:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDGFWw9Au4/nBW24cnQ/2Y3/hYTfN6ZRhxtKWfqPqGi41j9r1lSPK9ILOigcUeLZz1HefZaA==
X-Received: by 2002:a05:6122:221c:b0:559:a654:d26e with SMTP id 71dfb90a1353d-55b8d6e245emr8235393e0c.1.1764594755065;
        Mon, 01 Dec 2025 05:12:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea41sm12434761a12.7.2025.12.01.05.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:12:34 -0800 (PST)
Message-ID: <5667a9b6-bd45-4da2-941d-6eca0f758f35@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:12:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 50opbdHtdW-B2J8ZzuT3Fnt2uDhPi6gE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNyBTYWx0ZWRfX/S7wKPv37ehz
 FguwZEMojst/Qs3E0SVKQVz5h04NaDndnL6Ovp0obYa1UJS6AffJMOFRGzM2IMg7XuKRhLoJYXv
 L19XltYLbmtMJ+k6YZEs/OzJBMHLdSbs44AuoeMfrJquYj1539p3EycXGyhMB4EK1FbGa8dFVEC
 PHEGCb0jmHB5gTAAifHCgWK2kxLoQ7yFJq5NzQxIras8EBzX+blrbZXZn6ttXwOdDF0d+DNry3d
 h+bVgz/NCbbUX9qPuuVqaFXeUPeyudToXQMVWQl5YI0cMy9sQm7IyvE8MSv+DNbpSa9kvqrT3UP
 51l9Jb1zU0SwPAFMH/BFypB6pZYtUGYr3Rw5gnFOuF7NxEjCGMOzBwX6SJsj3NQRCqol5pT+htc
 VlioudySTG54Rs7K9+KdmQIvz6TM/A==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d9444 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xOAPA7ER2H7m3Sf8bHAA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 50opbdHtdW-B2J8ZzuT3Fnt2uDhPi6gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010107

On 11/26/25 10:57 AM, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

