Return-Path: <linux-arm-msm+bounces-90766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI8FMXyveGlasAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:28:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3B94568
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59CDA300825A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF8F34EEE7;
	Tue, 27 Jan 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oigmcdOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4yrhrpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A134F254
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516918; cv=none; b=Yh7MYF/dUp0iJWu201wFuWSRnaYuYMI8sGDYCFlpJoTjoZsC3uI/vo03PhUyFBXvn7OG5W8WPh9sfcV+5PdpYjeERzGaAwuk8o4he/rvON41DMqOncewiyNgekj6F3Dh5+zcKQc1VWeXW4BV4fzNe9IZO0cVSVTj1lhHrNKjLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516918; c=relaxed/simple;
	bh=0TnhOHipXq5IeJyOW/ea8YZad9WsYXgYzXEoGIEyjLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQNoygUIu19FvKk58nYMUliE3WOYzqFtkznFsJglA8DdRuZjAUQN6GGj/yAPTcUdD+Kj5CXkW+sxnyCQgVR8mIFORTby3cbwwcFivvG/eKhzlQ0HAztyoBj06uB+J1w7WxtzPmaEFs1OH9WFFwt8gPAq2FvQ85qylXToh0M+bcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oigmcdOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4yrhrpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87Kg42379285
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r08M33JEjquttJJCuf2dkn9t
	t3ROqh3wPBfGPr9pLQM=; b=oigmcdOgqMacdpd8S/wlreL8YZQhRANHFufMxqmM
	uF/PTXEo3hVEMUE6YqmNpMXVuMURm2v9bznzdGLIwVxku4ihEszsAfMg8TrRWIWq
	tjIqZw5773FoCb4+lxbH/dWVS+QZAoAYjOn96hvkOLg13Grs4UFlYiiFbrO9hwN2
	gc+ltnHWhD+ch67GOrN5KhmMVFxe+wLO1te9mLNIyDr2+JJVZ/M8LRXxk+NL0C+2
	2lGGdk4rfiOCrh+4B/ZqCj0Zh6H3bcIftWZvvNjrcktXD/NnIzp2tcZx6Om6NO6Q
	WSl0FuTC3p9Kke/hr6cYTmRmTLC2hLPOij/TZlBgZMctsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8urn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:28:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso1203925585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516915; x=1770121715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r08M33JEjquttJJCuf2dkn9tt3ROqh3wPBfGPr9pLQM=;
        b=e4yrhrpIbP+gMKK4TBGUOjkPEb9M4thdjpMbMTANXmeg7aZ7NQmF4PF0aKfO0F73+P
         4ReVU9JZFrPhJAWo2ozs8vb5CmbAOK7rUDNPMgAkr7RjMO/m9SGsQeqU7LE+1LsImDk0
         z15c6HkiWW+Q7RPQATabCk+Z+89tJfBh0NlGJeLc9GXXEJAe2nMJQbTDhhzsMLUeGgm+
         umo3tv7NjQVabiRIEDHtEfhZc1+aIA5fY6EjJ6qhN2UFkV9j20sPZl74eBbgmbHKtll5
         a/QNRQNqYnYo3UHGz8/4lCTkaBGASdQpEmKEo7nu0Sx9IwPj5+4qNK0HbLUpSXszbjQI
         zL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516915; x=1770121715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r08M33JEjquttJJCuf2dkn9tt3ROqh3wPBfGPr9pLQM=;
        b=S/lqiQD2L68NuRijZZ+FgUJSrZWgGVzWY8b/HcQJIW/Hm4w2GbyEpLoccSUcw62SKo
         t/FvQO+YDbnrBRlwueIMemvoKB8pKyecxiaj+17bK97gilGXbt3ritVGOFcQttYIqcrI
         W2cjA5JegC9OEHKFrZEXL6u2jHo3zdDboxtxnm+sfL33D7Uq62EJftrUjhRa4QARVhiE
         V9FyNFkqyzivjbrGdbqsIfl/V5J42+Kku+F1nm9SSzx8B/YGiJrqqYAV9AuzdRYb4t1j
         NWY/TRucewJKFbagkOCi4LRKPKuR2br093O65qQA6wKQIDZSrTt3zOWej7CX8gqKbWEW
         o6tg==
X-Forwarded-Encrypted: i=1; AJvYcCVt3iF1R+aK38UwNqJuQQHWjdQwE5sYY1kiqCFiUd7WzZf5/g1LdMGBJafxehl58zHTqxpp6J9YnnG8hkva@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4mZjDOVMPBNniB5hfeV5ho8pzyaU6qorEJ4Au2VrE/u5Z4d6Q
	Sz9zUMPR2fXUCpqqOkBKmduJAn16W8B1CEC2BhnepeoRl6Aem2B63SGA2FWWwnhWsT5DsVupJCD
	fET6JsasMj5S+3XfbthZfOVocp5ayXgjKg1ayMbCXAMhh2sGvqz2DyK8X/wpI5LkSp75H
X-Gm-Gg: AZuq6aK7U7NqrCMI+jey0PDVzlcX6NSPvRKrn3lLepKR0Z+z90SBGg/4IxqDcoL18bA
	k0DTfRSPLT8c1P401oKXbAvMKx1ci4bNaZAVd5Hru4mSZYuRC7YikgSVWooHYLvDZH3gJyq1Dhb
	5JYP3EP4rIya4Vgm+CT0zm4IYs31hhx7l6CSCR2/Hv4LOteCg6vZp9GkgL/F5FCd09Km/rQcWhk
	olSLeTzNwKfChd4uLo+YVQkKusEge0RXHSfnFo/+NDuHQVtE18kKcab10DSJMyYQmxp+JRSmp84
	LRV7nWX2treg3j9JZd9XcizLOlf4oICjiH3WmxscB6Wp0rX0hWgwxIoxSv5p5YYn5Rg1kKFlA/1
	YK36JWO0uKMTPlgS9SIeAipewypPT2AUOYx2CH9D81RzSTmbVlKvQT6zVGjI25ZJL7NyZGJkPTs
	FXCRoEEfdgSuSNTJQgG4l1ihg=
X-Received: by 2002:a05:620a:178e:b0:8b3:19e:307d with SMTP id af79cd13be357-8c70c232baemr127000385a.40.1769516915247;
        Tue, 27 Jan 2026 04:28:35 -0800 (PST)
X-Received: by 2002:a05:620a:178e:b0:8b3:19e:307d with SMTP id af79cd13be357-8c70c232baemr126998385a.40.1769516914789;
        Tue, 27 Jan 2026 04:28:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faf287sm31093541fa.10.2026.01.27.04.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:28:34 -0800 (PST)
Date: Tue, 27 Jan 2026 14:28:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: glymur: Add Mahua SoC support
Message-ID: <yba2z3v7klftzhmd7bghgj4y7orun2yo2bxzlwop7xflsj7apq@nx7znegfkmhu>
References: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
 <20260127-mahua_icc-v2-2-f0d8ddf7afca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-mahua_icc-v2-2-f0d8ddf7afca@oss.qualcomm.com>
X-Proofpoint-GUID: CwZIOm1VORkRpZNxVxc0kk50GVeUns1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX34X3VfHX08uF
 0/cBkszHOmke2aWjzV5DIwWN7WteuDuYCYu4SqdrjNzV5KnrTrH3Ut1qx8jC+MWW2f7hHwr9oMm
 VAAIfZWXnzgL28sVtH/Z40DziqKQIPmsS0uriKv+TV9dLcGT+ZhVAfTgu1/+OSV5CGxV93I3DfM
 YlGiNOc+sL9toOFxjmOlyqlgCrldd5BmHu1fa75HJxa34N1EjSAglEN8GU4ojYcEFYekPFru2G3
 d6A4iJhp1yi0Tx7B505fpVHjoSBy8CZvpmxn71/6W5qrppakwuiDIGeJzB3i0UlY7Sd0Iz7Ln46
 Tx1HbBwAsF1A3R4cCKVKcRlx2UMM7PCGEk/bv3RB+FPyTAbCbf/Q+X5TAKm5Cmm9pqJslrTPVzq
 M46G+x5TpV5UFnx5SmrLF+a7a/YwApfTR1YDlZx+mF8/stZSc79GV3BrC9iwg2W3W0UiZRYWVQG
 qEvP9yxwFxjBlN7dSUQ==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978af74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GtF0_HNWVELJq49vNZ0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CwZIOm1VORkRpZNxVxc0kk50GVeUns1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90766-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51F3B94568
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:22:07AM +0000, Raviteja Laggyshetty wrote:
> Mahua is a derivative of the Glymur SoC. Extend the
> Glymur driver to support Mahua by:
> 
>   1. Adding new node definitions for interconnects that differ from Glymur
>      (Config NoC, High-Speed Coherent NoC, PCIe West ANOC/Slave NoC).
>   2. Reusing existing Glymur definitions for identical NoCs.
>   3. Overriding the channel and buswidth, with Mahua specific values for
>      the differing NoCs
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/glymur.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

