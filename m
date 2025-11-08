Return-Path: <linux-arm-msm+bounces-80845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE4C43295
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 18:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C47B3B1EFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 17:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F58B15A864;
	Sat,  8 Nov 2025 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g68LzhRt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSj7xjG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8558258EF6
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624096; cv=none; b=KN/CLNjxFLFt1YFPqDXUzV0PMYwdo8w1FMOR6/y7xnTwFaGBwuXxCQxIKSnzwqUwXIXttO3a9zpFml62f3bIzPCabRhTQsnti5XbCcB7MXXDq89KUFU4a4qwyBkkxzvQ7376H9yH0bb3slYI+Pc5/j/oRNxY3DrDqPxOB7tcCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624096; c=relaxed/simple;
	bh=8AtMYJ5TBcJV6ZqE2nZp4MZjEGY6MVYzWwV8mtEFQqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7mjUNfhbFHlgtpgUnz6VqohZvlaYID0PToiMZKvfpAmghDBq5EnhU5RRUNq9Sws+3gaRRdCS9zzP+hmVLBZ0CsjfVFaUejTLRpikgCITBJ7suH0azmXtmAs4npTeNqeOz2V7iZAxT8DhgsDloP6vKOfif7fBOygNYfpB4NWLzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g68LzhRt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSj7xjG5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88Pe501190313
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 17:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oKNhA/wnZK5tHj2oJkGCMVi7
	EZ71nQgfta75KSMGCxQ=; b=g68LzhRtyWGyfImi5Zkj3mqRSw6GB6co+LrfxJMX
	X91jKT7rJJFJG6d0QvJ5GZ/K7ZEVahc3F7JGqEYQWTQcAZn26XjZ6xVGUoExfQUy
	oRCpQG5yqHtaxeYNIfz1T0mQf+J0Ofrs1gyXnXfgSyQorVpBmoT79cguC/3RNysI
	z4HNru0DlCJbdM5fFbwq7TNgUKAIn21nN0WBbEGOA+Q2FnqYdHr5qcPCUrMR2BYA
	mEkGUC4bp0FTP9ZsB1ECV2NAILg7/6d+Gtuqartl4j8WlH8Vbdf13L00Ip4AHgE1
	ydtj1nqLDPamLFdz6zTkUhudYJfrjwpF1yBQbzOGwPFUuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs78ybm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 17:48:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74ab4172so52964921cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 09:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762624091; x=1763228891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKNhA/wnZK5tHj2oJkGCMVi7EZ71nQgfta75KSMGCxQ=;
        b=XSj7xjG5a1GLm9/T/FEgIwdlPHm+pUui2f38pJY6enhjMG/kZWyxMBdcgWZF0foxDZ
         NF7mXxQenjkBYFkPUznBt0IWlH+Ixbo5teLWcxLdQ1HV76bOAubH6NXyJDUIvZOc/7f1
         0306u5WsoqlqkMplrYFewQdCR6g4mDY5zszRfiIJtOMUHrgRkPMt6ikT17p3fduYde+U
         xwaTMGOJHDA1sOVF5KxEyiMPTj8pBcy5UsWn8Ehe6M6iLenZFccH+RJdEmvzL3d3W8qZ
         CS6f/XAnMvsehmlANFi0e5m2lI3/8s+FJL8evwV8DO0SD5ocqorscGma8kzvEiJwyub0
         PYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762624091; x=1763228891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKNhA/wnZK5tHj2oJkGCMVi7EZ71nQgfta75KSMGCxQ=;
        b=tHFjTj8x8qXv22raKk8vyA+nGEnjkitS95j4tw2SCbTS1LTAOAwoSoeFJwg/A5QIlj
         BjUUfeh3whnrOg+CGoUFaKQ/cQPjobk9SM/h3rc+YHuXgdH5aoNPm+zLub2sF77kj55+
         7Y2RLrgrIlVnTXdbv8p1Lg5lVr4MsZCNi+j5PhvzvNVrFhqb7Ub2+KQZk61mIv94mr64
         8pr+vt2kU3SeUxxXYsNCjVa6+oX9vfX5NofVGJ6Jg6HgVzi4tF4RTvAXdy8VYNZzuHHc
         uxA2R0lilfAlKWQzTf8j4ecGuMDId1kCaWbYzuIvXkSfJXTYahQSgRtkEsG0Acbp+yr2
         +kSA==
X-Forwarded-Encrypted: i=1; AJvYcCWXWDasxqa1LJsxgbiMuB+x4iunlIf75aDFP7z1Z4EbphmeryBjJsYy7DBybJ4AXw6gAxn75grsMH+p4g4K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg794hKObLhdDXXcHKaHUC0bUadCpYxzfy9gRE9Jvvh/G38n/k
	TohJTvCX9NfL6NsO7Cz1Vo2TnbRiPh7ec138SbZfMwLj4Tg0V/7vgLYiakCPYYf5H4VsbdNYMMU
	x9wdaOTdfdL27GpLohUtEOjFXR3Nzd3msfyeHKlmuFcbkLwj8kg7yz3zmJtPYbaaG3BQq
X-Gm-Gg: ASbGncsvPPpZS1IGlX6LwU1CkV6zIwquyFTtkjd3JiGF+sXqUv/FdhjpsYzdOeOsk+S
	OKMdwUb/lR+Q0oa9Fj4eKkOMwuaf9THpudbenrP/TJ4O98JrQ+8kSe3W5hp/4W4UcprsMt14v7f
	viJr+7RYhPQrXscThlYwa3JV0Zt+R7ZsFqEBz9+0IbTvu8EtBskeQAbux6VpgxYqDNM26hTFB6c
	QKmDH/SnxDo4O7P46L921zgz8ehgWQAAFNC7fS6nWsw/YMwLMCLpliAV2TRUPRuqRG5Ow9dpIZ7
	fHjmJcVu/OBxvt+3JlddYttJ1I2bTyzBLl/Vgi6n2DueveUzDAlp0laMPIIdDybzagxmA/h3XUq
	/jXzELWh87og1AOUxpFihXPQOhxFwy97d48COJPvQKyFZlIf6Bm6jZrRf
X-Received: by 2002:a05:622a:130a:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4eda4f09bebmr39398521cf.35.1762624088799;
        Sat, 08 Nov 2025 09:48:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIsSrvfAIAazMR3+R4mtJZyAwKCCj0ixIasuIj+5F2b3mDr+MWrB7+JvGQoEoO6wGCxfnb4Q==
X-Received: by 2002:a05:622a:130a:b0:4eb:9f37:9df0 with SMTP id d75a77b69052e-4eda4f09bebmr39398301cf.35.1762624088398;
        Sat, 08 Nov 2025 09:48:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019cc5sm2334971e87.27.2025.11.08.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:48:07 -0800 (PST)
Date: Sat, 8 Nov 2025 19:48:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] interconnect: qcom: sm6350: enable QoS configuration
Message-ID: <7anacd4dajb56nsr25mjjd72deiezzzqxewhrrayo7btl5nf3i@43pqifo2pwd3>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-4-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-sm6350-icc-qos-v1-4-8275e5fc3f61@fairphone.com>
X-Proofpoint-GUID: G775MKOnnTmLTbs9pbLNPBxCBo3eHPat
X-Proofpoint-ORIG-GUID: G775MKOnnTmLTbs9pbLNPBxCBo3eHPat
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=690f825b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nyvGelbgox2M8jkpOYMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0NCBTYWx0ZWRfXwV0ZURGi8y/f
 HfWSrUx+USFo9uBQejNmrH9w+sXnW4PtynXEUTfUZzzATeE0LXroXJXzynWVKcByw4Fn9m4NvBr
 K3fD8LXgIdPY9XsExBCMZA+wHwnJhtJGq2As/QZ909kD3N18WFAUWr52KfRt8l4KhA1pmIJvvlu
 J1mOlMf7jHPjFe3qR+NtOGVpJrh1qJ8wIzKmtxfcellAjQiWVoJkbMtdKFU0bS+PoO4MawoCqmT
 uoDcsVglZJ26B2ZE7oqfw/TcnLLeSMIVrwYd6l4ourXEWuV+dCKEf/mb4+DSYbpFl78g5iK+0KC
 aE525kQCZu/78byRpHXPzdaMTRaN1KYTzQuTbWOWbD5x5KkUcSBEr+EvOGXecMYugVNbi22Mow/
 qQTrRNZ1Ao9IaSHAWw67vib7M7Zp3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080144

On Fri, Nov 07, 2025 at 05:08:50PM +0100, Luca Weiss wrote:
> Enable QoS configuration for master ports with predefined values for
> priority and urgency forwarding.
> 
> While this does require some "clocks" to be specified in devicetree to
> work correctly, thanks to ".qos_requires_clocks = true," this is
> backwards compatible with old DT as QoS programming will be skipped for
> aggre1_noc and aggre2_noc when clocks are not provided.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/sm6350.c | 288 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 288 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

