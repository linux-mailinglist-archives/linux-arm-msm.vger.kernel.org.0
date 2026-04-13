Return-Path: <linux-arm-msm+bounces-102981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AQzJ+sY3WnoZwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:25:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E63EEDD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CE2A301EBDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FC72FFFBE;
	Mon, 13 Apr 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fH43SR4Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLS1HsbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057328505E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097409; cv=none; b=LpH9xjc2r2tpWyHdFj8JwcDQ/paGIOnjMqDFEmTYbAGpzf9f04KCeEvmp4xTFqJYHVZQEw++0pBWpp0p0qqYGPswUPwNNpG7vgoVH8WgIoNRuxVX4Kf4wMXloT8cvm/AQuSCWWTPfejWPTnhoGcAQrWPmxIM+PZ36ymChXMxuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097409; c=relaxed/simple;
	bh=uVK0Xv59JS4HDRNv+cPyPShGPwZXklo3HF/N1W3tfbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGeT1oqXGtBaQahd2if8qzNb8sC9uNLi6Pu/zkLPAexQatjB/GL95t6vjQVDIuUrAl600T7ztonQZDtaqqiJ+RT7/crCgstWnOp++wq1bJjUUVL66nDgguPIoYiVWaLy/iSGydKQOBSQ8CKc3qC6S6/uCT/ErUVNODiImueiBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fH43SR4Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLS1HsbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEDNv82556766
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 16:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sguj50zvkqWIPPgGiJFdHRqt
	8hG3/As6/8RC0jZYNNY=; b=fH43SR4ZwOI1vQtcxZfpOJCPOa0cnY7YyCDHlEqk
	z0StHl53D3W/HbRH6rThMluzHVXVw7ODOsRtI6a0L7fxv2fY5+1apQySs4dCXCzr
	A0jVHH3BtaF/g7yy/wwW2o1W/Py14E6nu8SSzT8qUILDgmS5t7xBQf7IIMAWPkHA
	IegKPVMbFuWfRh6GB9NTxTtpTL+lhrBoPyHq4PlN/K21uF9XlNI0TnyJMtMWNIgE
	K453HmjUtwTMk4V5s8XOw4dDpRzUuQh9stFmZeMntaVU51jgv9ddaP1gq7JnZ4TZ
	AqXW7ioqwpJ+1kGG7HVVfDJmfdyWbndvBOnnjHfnH8D2sQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh22f8g0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 16:23:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so11791209a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776097407; x=1776702207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sguj50zvkqWIPPgGiJFdHRqt8hG3/As6/8RC0jZYNNY=;
        b=WLS1HsbY3kqch/mqy8YcfowbsgoyUr96PbQuehLHA2Mm4U4biwyuSLQT6MXIn7mztX
         8DlWegpikG8u5an3EmCGDEZ8XCXV6R/UO6gcwN2hMqG5nTSNLAzIZwSVwq5CaHMn5s9X
         lXa7wScdhDw7PG4aVA3dAVksdc4qkhOcTrU2Yy2dtqw5zUxV00uBqQye+aT8BBQPjyzQ
         yvtAGe8y8kr+JmylvRdmq9FDk13UdG17ASHtHMGx+i2sfQunovLrYScVpM1j6shiWO3o
         3dZ0WokYjPzZnccATO/NLguOjYbJYalWe00d0eSrG800cgxe9wigIOx25eHfEtK1rSoz
         7E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097407; x=1776702207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sguj50zvkqWIPPgGiJFdHRqt8hG3/As6/8RC0jZYNNY=;
        b=kax9StsSCUrKL/noGs2WygrHhb3FAkXeYT7nSluItdeYSdB16YmHA+IE48Pt2SFAZ8
         YU0xSkdU7KFu4LgVKd48vJ+boYhIkq4XCFQiAxmQwRK2WtEG4/6QRN+y/KzZHe39lKpi
         AIvYPwDVg1Tg0ZCv1T11XQ4LgWaNZrpgZ/eZC5WMFRiOp/b7sf7IM7bRjPXhdCN4wtUb
         kXQ5rNOM3FDw0z0c7xYYDIz8UxBqFLgHSf/dauywS247Yj5m5mIyFVpCjgW2Evv+/VK5
         sJI5L6b+ho92jvwmwTbUYsCMgsu0m7foAUq0r0GnHD584fWHwdaglABLrRPy1KVXH3tp
         KXTA==
X-Forwarded-Encrypted: i=1; AFNElJ87b/atPEAO+gm/V20A/D/7Y6BYQUYa1I5GTpnjB1lUxgYX1kTlManIItIX4C6JH2Caxysh++Fwrp4QNMT+@vger.kernel.org
X-Gm-Message-State: AOJu0YzHI829S4c4KkS+3OZG6cljcM3XD7Sb19P3/3wxRUpkyNP8MeYG
	28WJQ5elijdv7RX26DWaPq/hJXh9qRMG2m47K9CBMHPntzq/Qi/EhQgJTzJk8EgXTY3Cyc1XGPn
	IwwHHVZTyuixSeCRqaPM4KTETCb/GCQF3CEX2wfCSznzWtEqgFfCEhUWg5PsngO5eh09o
X-Gm-Gg: AeBDieuthM+803o1pubfQv9k4XK7f8gT5uVt5sb6I5PesegPpy1xW5RfouUAtg5vgPb
	+rBQDeO/52FvRiMvox6jV6JCdxWRWjaBwYXrmpEdIk5dxdhU47NTXXi5+UZvXdt6mYgV3qmyHtz
	R0DvCQKKLP4Tb8ngGcGycbkq4MJpPID2kq4S7T8al8JNyAowUWhUhtFOMB9RPmy/VlQbkoQbnf6
	WUFLV8ILTPfC3pgHDga4SHjEUY+iNvEW/+m+V43E4HWd2qwmYejaid78yhQRvGQ6zJRPbety9UR
	PjcboxeusLeVAjYp60AEiNaHtUM5+W4hnJM/FS4uBe46C7K1uJsXkXlrLDfCdlaR0SCEElQ57eA
	0nZVQmDgWz64TY47H8VFEAV2x4fVPgITZCCaEAKyE8r4BAV+E
X-Received: by 2002:a05:6a20:394d:b0:39b:f12e:d51 with SMTP id adf61e73a8af0-39fe40c77f8mr16132368637.57.1776097406592;
        Mon, 13 Apr 2026 09:23:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:394d:b0:39b:f12e:d51 with SMTP id adf61e73a8af0-39fe40c77f8mr16132337637.57.1776097406067;
        Mon, 13 Apr 2026 09:23:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a36898sm9831729a12.31.2026.04.13.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 09:23:25 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:53:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in
 comments and diagnostics
Message-ID: <20260413162318.utqodq54calhoast@hu-mojha-hyd.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
 <20260407-external_llcc_changes2set-v2-3-b5017ce2020b@oss.qualcomm.com>
 <20260413152528.muemkbfuow2qg3ta@hu-mojha-hyd.qualcomm.com>
 <516270e3-1d59-403c-ad01-7153147c9e30@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <516270e3-1d59-403c-ad01-7153147c9e30@kernel.org>
X-Proofpoint-GUID: H0HFPa5EFbjokPXx1cY6nLdz4oT6gspo
X-Proofpoint-ORIG-GUID: H0HFPa5EFbjokPXx1cY6nLdz4oT6gspo
X-Authority-Analysis: v=2.4 cv=HKXz0Itv c=1 sm=1 tr=0 ts=69dd187f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A92sdfvMMGvHn_BerJIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE2MCBTYWx0ZWRfXwmBizcFOfS1B
 Ifzmh8RWYoqTUuSzcgRmJMAbN/wGrXgDpgJIOa2wnOHZHtHST81TOLtkrtXh9LzbLWPeD6+MbED
 Zi7MPHglG0l/EjBVJAM/DBcAJjqIXnS+PoSq7gFGbhuTDrOSLI8MRjO9dKwXW6hHUjtwZcvKNer
 gRii8P/oSxFhHQl2Z5C6ds44yuHezNXeqbhwBsIPru4gTY80TYGh3dN5iSixqV3uZdnEL0GL4WD
 PKJBQaB3w9iPK+XavGHcRF68XCRSXlo/EGAlVkgClpoAPp9Q3Ww/r05oacGYU3wRduSOzpvwmok
 2a1p63Vhnox30d14+MuEFy3HXWXQcoLeBKuDbQT+p+by42iu98ypijpzsrvUqKkTamPTZJpFP1C
 gbLHeKlg2l4ZvB81L/NWDdwvdLZ2aRssaV8M/7jT35Ywg8rwP6K/5z1K5twCPVd5RuUfKtVA7oE
 2PDTaPCFOUZqrL+FyOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102981-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 409E63EEDD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 06:10:39PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 17:25, Mukesh Ojha wrote:
> > On Tue, Apr 07, 2026 at 02:51:49PM -0700, Francisco Munoz Ruiz wrote:
> >> Capitalize occurrences of the acronym "LLCC" and "EDAC" in comments
> >> and diagnostic text to improve consistency and readability.
> >>
> >> Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > This could have been sent alone..
> 
> No, not necessarily. It is close to churn, so multiple subsystems ask
> for doing this only with some other work. The process here was correct.

Thank you, otherwise, git blame is lost for no reason..

> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

