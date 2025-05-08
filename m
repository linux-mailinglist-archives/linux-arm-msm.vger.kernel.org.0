Return-Path: <linux-arm-msm+bounces-57271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86513AAFD11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5332E1C04522
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869E126F455;
	Thu,  8 May 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuXlWv9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD1C26E17F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714642; cv=none; b=l3cKF+A4H7ygLoyB1XGZGE+NB1SoGUKIUCBozh5v7pATscPTiIxP3vIgLeYKehXJdvFWjUzXoWcXbcNPREh5nWBmp1BZNYDMQA8Qz2NPqvD8Cbtvd+8t7ovfGi8szDxrY5II3UYKKHzNUte5C/mkRICcodj3Fqgl4g1sPlxuD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714642; c=relaxed/simple;
	bh=t4oLXiz8QfvEsARyF6xExsOe53WBHk8ZMnYpTzjULGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZYxMJcyBU6tlPyy7i972Do3I9HcpRYkRRwijY4ovN6YaPQVsSHElObsupck6T6e/7z+J3KzIoWF1ef4sxMQVxfFSDy8AG7Yf1nNKpsg6pKknYvVBJGr7FNuCbFxEpWOYx96/TKBPQlSAH6xOoCQ/mfEpxi2bHCik7xvDkQllKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuXlWv9t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488lT3r019197
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=; b=TuXlWv9tZ50cNzlA
	VxNCh8Dw7PETMDZTd1RX4sprzGJ8jxg0iKvbCRrW9a/YGqHM3kfs5il4hh5o04D8
	MNNn5AGiIgiX0a035xPOZLeMgdvR43Hq1RoFrm9KXdNrhq+1VnZ9xbQViUO+UFHm
	tEO7O8zznYIaib8nskpb1HcVoHuqeiowG+GImxBIikz69S6ShSAq/TcT4XWGlOvd
	FH6oZgtd3mf09TjvPxAuQJXx7YF8wRZ78/cp3uYPep1B25zQWEqMP/byaWvGgMcS
	qorxqNwrT6vwM0vu+TdHKpEs8QH+fNiARxSziGbiuW2esQe/0cc3R8AZRoO1EfnL
	AaA4QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj10em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:30:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so25581785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714639; x=1747319439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=;
        b=oyzp64TxaOcp9xGCS7+jgoD6XZCa+OcvnlXfRLKXwEAhxh3Lgdd7XMJLiZtdBf2Eqo
         3FbMd16L4K3RXj9n+xD8iSoMHC0ZbvRuZT+9YHQzNWV0BAhPCioljS5BCr/JU8UezrS6
         S4GAeFHV36AFB/KLt8FsqAmX4O8b3kIkRu3ilGoZkdD6YnjSuIrt2/rx0aLHfqm094AY
         pUDJER0pOYCOeQh6B4W7nvOioF9PdIQIKgxZjl/yIwi7DuMoI/yTv43wHu9pGlRVbMUP
         kpUJ18iSBQe2BGSuTh4iaO/YwlqVbQjKfoJzWu7l52nHo34yy5HanaNquua4JuGzKaYp
         Abzw==
X-Gm-Message-State: AOJu0YxxxApoDv5PIdRYZ9RaJrK0TGgjBq7yod52eJRKgFW0GuKoyl80
	jwQle0CrSQJxWthzCwZZE1y2GQZEDLwSx+utPyyB7YYQJeqWffrfn6aiwkeSusWdwNOT5yerZ6K
	1shBA24HTFq/6NeCd+ecCu8SZML5CDPnAVEP00piQgnY4IMJhONa6/M1mMMlMNl5v
X-Gm-Gg: ASbGnctu/0LG8rh37tMXr/0mMm96NNVI3QbYhYqtetJPu8sG8bZFggfEurDxNwqWyuI
	eSm8BajeAYPnnfb+VMU55rdhfGTqIliOLvtwBw0wCR3mYuRcQ3Kr3/m6K0Fwo338VGPO+FniDND
	0aw6TRzycMkRLg5pD147GCoKNpfuuoWbCtmJKQUbuGvCOKrgo6QBXFDLfTDWIjpsWYJB2YK4jSJ
	8TpSNDEOi//IeAXwyAxzwrbk3QgRBrnyAJgTOk6t9lhstxXE5VUg1r/Nl8m3n3vmh5Ci4p8/9Ya
	rwYnlyUOskQNTKTfeZLmH4DS24ThceFQB4bl19nDR0oileoqTnCdEjvd6ZoGVC3FjaI=
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455457785a.2.1746714638994;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERWPG6KvKc50ZOv48iurNgCUBU1wb1dtfWuaQD0GVFc2xadC8U2UgV9n2hIN+6mOuzpaQbA==
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455455085a.2.1746714638460;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147403sm1100399366b.13.2025.05.08.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Message-ID: <314117c9-1865-4e33-b7bf-5022869412ae@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit
 TPS65132 to 5.4V
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681cc010 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=p4YvtlIvSzqog-DnsKAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfXyILfh9rixYym
 9KoyweqxTcnLZoSEacm5TzusPYEXFoof1YT1zRgFunFJEr2tQ/pe+YDt3cBB/8MAo9latIcXhHW
 GDlQiXeNCLXZNu4Q5sXnBaRkmW8CdRrE7yC6lnaMdkGENlv1UGgSnLoSPwa6MjJupTSfEftBL7Y
 xvUMwAnt9S07Dkbcr+LRgZSZzUpfxFk40+3X8T02O0ToqXQbO0XQqDcItYTu68XzWW8RyJmB40X
 d+76oVY/MS08Lauth3Gs/ktSBPbM2P5Bq6tsrw6TxfI8UX+mjf8abqhczPUqVeEbL8Am9cKSOHp
 yjR4E5ck2WoIFeC6E4pdA3ni0J7cSwWhUj/zFdCcFxYBK5JZxIlGAhkOp9uNv2v099USi9/S6+8
 xAze3i0ElHaZbT6Y+MnrYU0Fg1G6n79uT+P94o8uGAIF7mOhrp1riUA250ivKnixT3RJ9C2R
X-Proofpoint-GUID: YetSCmWENv_erViwvvEOES6Gb3L_LEXh
X-Proofpoint-ORIG-GUID: YetSCmWENv_erViwvvEOES6Gb3L_LEXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=751 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the TPS65132
> outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
> on runtime through debugfs, the troubleshooting guide confirms this as well.
> Specify these limits as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

