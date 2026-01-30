Return-Path: <linux-arm-msm+bounces-91236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YbqsAhg1fGmfLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:35:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1BFB71BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 05:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFE673004638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 04:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ECD1CEAC2;
	Fri, 30 Jan 2026 04:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPuIpXmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IInjJz6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6B1A2545
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769747732; cv=none; b=oOUPw+QlMaVgSK1R5BwObN+vdLL3blMc/YUSVIUG3qo/Ctx/Y2VLYOKQHpJ9vhQQdafoWMFkhBG39gfQ/KUlEygDZmbc5OaY8pNj1TsgN9lGmL/+4N4TeKARZbQAojR+J0lz1TSlob5tNlbI+AgVcp58+SGlW0EWpsxuxCaM7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769747732; c=relaxed/simple;
	bh=/AZ6uLyE31sl1k6Vq3ct9rRoRpU7DrWYl9G26kGJdgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPfNdN+FoENK8ookyaoDQGWfWszIYj2IZvSncQ6Kt88A8h1uG2OtmwqVksqCjhTSjuDC+9x5NnQS9ZEkNgKkvfwT6cvwt+ZVsJ/5d4JL5wepQjcHOW7xgTv+iTJP6oaFZJoVrHkyJDqqHVmGQpQFwDD3PwVrxti5+C39hMcvefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPuIpXmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IInjJz6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3Vk0p2120919
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9tuSV5RmO2Vliq92SdHSrIxT
	kWILO+EijHJ+7rY9jSk=; b=oPuIpXmDeGYwyEK0fQM8ETXJrKmmvUheYpXgxSqX
	wOXlucJjmW++ScvSMqCUOU2Z/A3MgJc6C/VceeMnmqXXgbLIAsoXXqz/PUF8qmbS
	4SeuqrXAqyjHepKeelbHzEOKA2N8TAUw0KFB2D40yZ3rC4vYrsBtys3oqSRYmT/S
	LnWAyRV+SKzp6phlkABwFcMfuHg0G4QgxeC1wi2vtHgUkp4wnG4J4NMljY1PO9Ds
	Ot+3fkD1SiPxqOaCnTXlemhmKuNQ//aeJ279ENUci10w5IIFZGgd327IC1s+9vIz
	8DPiJTXVimbjN2iEhjyq24XIlEiv4uk9SbgfNTraVkhEyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0d5fsd7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:35:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a5bc8c43so493772085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769747729; x=1770352529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tuSV5RmO2Vliq92SdHSrIxTkWILO+EijHJ+7rY9jSk=;
        b=IInjJz6vZbjXmFV2Wz1BJVTuV673R5QgO9wVtEdsI2f9p8B0TMABopuIa3P5HUMT+H
         ZUaQoYXKJ2WN3mvDsxH/K1TdeDdKgco8FEzQ4Wnd35gs/D92sHFaYb7JQoPPfw9Goeme
         kErnzGAP9t0wf9uINt8C1oeElPbrmMazbK2ITS8NEcmtuKnsxvG0RyFWyGCyrM2CztT7
         rReYcEGLHcZuTT8JqISpju/Cvf+ClNP2WmJ6wKtMg245+62tTf4P0nbW+UqtfeEhKTqV
         Zft6yAycCbpkdACy3isIR0BjA/8aq0vJsp44M1xgltPc6eeLfjH2QBN95wLsKdRwvJoy
         EK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769747729; x=1770352529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tuSV5RmO2Vliq92SdHSrIxTkWILO+EijHJ+7rY9jSk=;
        b=lmsv6Tkf6KhzynHWmF40goLFH95X/0t+8A4zBjokRddX8lxkAS9zBDv5KuRyrQEoue
         2Tir78l3Lbdv2q0bmnGsXevcFJG7f3pZ2hmKboEdY3Zth7Xf3oxiGIejcajtXRj6xMoZ
         W60K4s+SOUCGPEWnNCBmS+YsuriCm+NcmO+R8yFUuGuMKPSEMdPFs37aZJ7Oe+EOOHKt
         j98NqWhnIgoFMwCH06e2sAVZxUYF97/wOMcMXiQT8mccZj1Ha+F0eFpXR07XfH7QqpPe
         3oCWgFVMnZC3li9zQOL9uJl+lu+uerMETW4zV6+hktfGTHlcuVZVMCpd01RR8gxkA8Xg
         XDwg==
X-Forwarded-Encrypted: i=1; AJvYcCU9MRmHXjqC6ke1D3+I6LbgvELBTMlv+CV97O8ubJoXObtPvRhzwlFrNnEHKkerREluG2BbQ6UgYXvWg4kX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkl2Ka6VOdkbpwdSN19j2E6goVQ2//bKfHIt5d16ygVPtYTxPD
	L0hR3LNjp06LUxAldP8UgW0H7M9XxWAJKyHlEkAj7sV8Y3srX+dDMZ07+JRbj4MV653aTdIjTGO
	aIDZoxvqs2z0OzKXx4WLDqPlKHqP4sKjBTO9uY2NxPAziPmnCwmg8SFM1TjWzmXDZ93Te
X-Gm-Gg: AZuq6aIKTFLJpD2kChL5+z2PrZxedS05FqItO01ZtPwJHT7fgEQtBpzpV8RMdJZtr1w
	GmRF4AZlQk8VIyjgPJ9g8ZayoZluPCCYwika3NmPGIzXUB+Uu0GrEsfHKEX5FSCCEl/x+2mdK2e
	umFy0m9VbG0qM4DkzhlR/JAVAbyLGdAi97EsymecZAFurQBBy2OWLNaviOlkicqwPn+C/Aj6GBc
	2ezv57Fdp8SVl3U/u0QtnaI8x50BBP1GvsqTWXUBdNxlHrjPWTCOe91A3YJELoPQqzOfdMGj1K+
	LdosrfZGEOJkwBPvjvwodB8Oz94EUQivX82CYS+VYgVsx3lxBWtbLTubcGsmwFsIMmAX/bgJDfC
	Jsork37t0CQLwt7WPfRI1TbbspMkTV+N++Y+gThj17tmxl0lItrwpN+rtPQ63H3+kbSgtt8ZVNC
	N6ApxfHCOWjm09xqgomMxBIPw=
X-Received: by 2002:a05:620a:7089:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8c9eb21ae83mr284175585a.8.1769747729003;
        Thu, 29 Jan 2026 20:35:29 -0800 (PST)
X-Received: by 2002:a05:620a:7089:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8c9eb21ae83mr284173385a.8.1769747728544;
        Thu, 29 Jan 2026 20:35:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c621basm12312931fa.13.2026.01.29.20.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 20:35:27 -0800 (PST)
Date: Fri, 30 Jan 2026 06:35:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: pd-mapper: Fix element length in
 servreg_loc_pfr_req_ei
Message-ID: <ugkxy3xshjjodb2dkbd6ipwvochsvwxpdhpciboqjcnsn5iaz2@hucsalgrr2o7>
References: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
 <20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAzNCBTYWx0ZWRfX6/a9YX5KBdDb
 49QsplOAiXeh410sbvoTb9OvHlSyKjXbSZaatQ1aINArn6KU8BEV2wb1lln8d4pWpiu4vZfRmu3
 tyXDG3QkE7zjVQcTIFP8u1j5DaLkhjcAOUr1kJTIXYLPq41VnKvca7MJMMJzbfhdpKUNoZlaTu8
 Gzd09VNtHCWkZKmb+RuRG3BJuUouTd/46PbktosSUCpVwJDj1pNL5EmXjgyRWbgBUcdd2lhNDqu
 maRCaaZoDzYnUuo7tEQ3G1RXPvtI4SJcB08ggzTfvqsua7HXX0hxor7HUank+ZxWXtWyQe9RbzD
 V+x+taUP4Yb0I1fpqVWX/m3hVcnjno0eNGKxF4/Y/SYo+sm748sZ5e/+S6MY9WwlQ71Y1UNf5um
 zsLaxxlnNvXvCLB7SulsH7Dw+pQPd43SZbhytNxlP0cWR/1ha16TJRkghLEkLmdkogSYPLnZsIr
 Cepo/iPDIl9WG7Q7/NQ==
X-Authority-Analysis: v=2.4 cv=U/6fzOru c=1 sm=1 tr=0 ts=697c3511 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-BAboINuH9KO5_suxkYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fgOS05uZyr5Ehs64bunyNtXSYG33Hsug
X-Proofpoint-GUID: fgOS05uZyr5Ehs64bunyNtXSYG33Hsug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91236-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E1BFB71BE
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:53:20PM +0530, Mukesh Ojha wrote:
> It looks element length declared in servreg_loc_pfr_req_ei for reason
> not matching servreg_loc_pfr_req's reason field due which we could
> observe decoding error on PD crash.
> 
>   qmi_decode_string_elem: String len 81 >= Max Len 65
> 
> Fix this by matching with servreg_loc_pfr_req's reason field.
> 
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")

Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_internal.h | 2 +-
>  drivers/soc/qcom/qcom_pdr_msg.c | 2 +-
>  include/linux/soc/qcom/pdr.h    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

