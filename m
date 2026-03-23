Return-Path: <linux-arm-msm+bounces-99117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF2LLLDpwGl6OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:20:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56F2ED706
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 063C4300767F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFF83382CD;
	Mon, 23 Mar 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrtLm/FV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOD51cwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A00217F33
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250411; cv=none; b=f4FovzT1lToUtTRdj4DJSxa0u90jpuT+g9bl4C/GjXgihxTOVV6poiHzXc2c876iKlTX3Z1pIwwLeJtdpNqXKKt+1xRizcOGEFgqlUANgorHWt/xcG/bb5tdE4AAd7y3htG0p1eVGUy4+JguWqyd1IWlwhemxNWFmRzi3ysnTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250411; c=relaxed/simple;
	bh=/h7xz5RjbKlufy7zPqIQyK53P9ImGrh0g4r1n7XZWS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mnnfatsge9QrixU7n/oO6dJCnnnua3PmFJoL3o4enPD9e1sDipa00CHHBIdYOTZjKSU2gIAaMhrNTZUZdDcMrmzJ3twdFoFVhRs+JYm4qXfJGnLnZz7mvNal/VGkHMzJky052usQUz9eVFdb+ZAZPiznSHfhSXSd6bZZf60ESp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrtLm/FV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOD51cwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7I5Kw149791
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=09vdyJOxzWNCcyJqUYp7Oq1w
	C+44EDS3KNpMp6xvBow=; b=MrtLm/FVSl3rmM/cgxPHjCVLfjtVEGDh7Qgtb2wd
	smqtrd58FKYRyL1OjWdFNM5Z4q5N89auIF+RXkAt7gI0IpMWwU79BBCzInSGjVAX
	72YoMSqhD7FUDHEc/dSHDuKftG2QTxAUs+IQegqDYK56d1YEROdC4TnaNJg3mAEX
	pvBoH7GwY5QWBFugQiG6HCZ0kXSEmrl9vyxJn8SpRXoPHVMZRFwEWdNg1XYj2GhM
	fL6FkIA6gvWhWNlszNvXcMQpCwj2+BYxr3YYfiz626GcKS3219D7VMHtnbaosIMm
	eCqKyYdm3MugjnrPIK4FQ4lfQo47qsOPhXph6fVrpC+WpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk4ea8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:20:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so200503231cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250409; x=1774855209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09vdyJOxzWNCcyJqUYp7Oq1wC+44EDS3KNpMp6xvBow=;
        b=OOD51cwLAHW5zI15AbJSZxcgJ1J5jYHQi3y/C+xJBGWv+chh8VD5OEMe7Ojeft+oEL
         VqrNKSvcgu3kxYhaXiX7RZbPnYx9k5JGAgWDCkEjTG45BXYemXT/eXK4cCfptMIEo8Jw
         25dkkDuJVkybu96fCEmge1G9gVyfLtNKNP0EwSTFqCVfoenr+3abQiSQcAaV4FOGpoqD
         Y4G9CUK/xwdPN9oMXxyfpwlWwLe0M2/prw7ttPhWl1xiLl783/M28K/5EvNMObhuKyRn
         g29VXWy+ksixwPkbWAPmAJyzOZ/uXeC096avKhHp2NUCh4MB1pw8HO/mFKcxvCIkCG/H
         9F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250409; x=1774855209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09vdyJOxzWNCcyJqUYp7Oq1wC+44EDS3KNpMp6xvBow=;
        b=kpLs0V0hY/zKO4DP40M7MRCOyRPF/qqf4kub4ZvMArFCBOgCu19Dxr6a1LXARouxnz
         XoKodzVZ2xHs7Jm27b87qeaEH1xt8nXRbPBkHMUFPlwo4bwzkct5vvuuWRpbe28eteKC
         4F3+mmCqlC6NPiG6ba7hbbIxjwFGMyHYf61X0Mc2+KJa7FBaOhnj8OcfnGQREJkGw0jT
         Wfmw8gHRxCGdCmFyqFvvzoXSFHJ59LMo4FTdzGbHEdrVdevNVJMnJ08amAeeN6GqH5NH
         es8u4MAe9asWXk5as7EN7jO7DYAKwwxGdrVD4YWshg3PRVmpwG8Cae2hsUlAljdQNxiU
         I4QA==
X-Forwarded-Encrypted: i=1; AJvYcCWE7U69C4pZkX3cgrsuajY7O9+/nfTJK0qrSZ5yzwg3ngiZUlkYj24A6Wft/AzPCpwcr9WUxd+f9cbo4akq@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsJlB6bwos+gjaTOlkAvv/HNuSMdjTsjfP1GSX1WIOTkRk5BP
	mAigkvL3tafVtCVqis409oFj4I/HpHjH772hCYXeF5p4hLE0nq70Y4zMUjwFqV0lthTeP+Jb4yj
	Ot3fjipgG/34hP0qSdj65eAJXm0wSCfB/mAPFZn5YwHGOys1k6FwXPYP4kfI1QXB7oGF1hkKxOA
	0w
X-Gm-Gg: ATEYQzzq3CX5KDvIyy7HThSFEpaloxfNpgUIrkiKb3+jxl0mu+KyU4lGyL9ecSc3t5+
	ZAKRqXNcBkoetfVUFWofJKiS/TykSsl05lr1ahswmsA2cGYn42hA14tduRs0sx5g9tlRWf0zSqJ
	jTJvyoOiw1jvHTgfbv9UoMOpWpluQLbhnSuVZf6pXlJgdRleN0uwniWXegb92O3lx8/fXONremD
	ca/FFyeyd5WaF/QJqMyyFBSf4g+iDtmycDCz3wf4XWwFdAh4kKWlq/Q8HZNEmNVPdhir+yzvn4M
	OtExORvaub9EhCkMQL1nPRxKzM2wfHJHz33MzaW1AQ2l3qlnXHLXahRV73xa6nalZSERHaduWij
	0ZNochjHgf4zEpkFG7lLP70y+QDL8EnP3o765SL8omF6n8JuHOufoqZX/Zh5x8bU+lmwbs1qbnC
	abytXnH/J6daBXAsx/YuDVQYSoozzb5a9xoqE=
X-Received: by 2002:ac8:5158:0:b0:509:3cd:b243 with SMTP id d75a77b69052e-50b373faac1mr126899631cf.21.1774250408881;
        Mon, 23 Mar 2026 00:20:08 -0700 (PDT)
X-Received: by 2002:ac8:5158:0:b0:509:3cd:b243 with SMTP id d75a77b69052e-50b373faac1mr126899441cf.21.1774250408378;
        Mon, 23 Mar 2026 00:20:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a113csm2367857e87.23.2026.03.23.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:20:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 09:20:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on Mahua CRD
Message-ID: <ntagbdhnyitngqw4nmwivbjp7nza3rrod4a7ak4s4u7lantuls@u3ym3kxprrl2>
References: <20260322-mahua-qcom_scm-support-v1-1-00c50db332ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-mahua-qcom_scm-support-v1-1-00c50db332ee@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IYMF8LLBD8EoeGJagbrpzBVA27Z0ia5F
X-Proofpoint-GUID: IYMF8LLBD8EoeGJagbrpzBVA27Z0ia5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX3tCAmjAEXubq
 UR4uGNH5LVt+44E6e4r/PwSyTvYK33isoa/xBQfLhlxsQneppJ0lkH6v7YI1TG3gQzKvmvDaqPb
 +2CBX8vWVZ7QCjUaIvVAMD2B4TPjQBQUjS2u4qyJxf+IAUFQ83vnMgZNnq543eJREwaRM7n/JOP
 IgibIckF+91A03BbRQ0YXulzC+9JBEgH1eEEIL0C1BeieB4c3/cVHgj4t7lRHb5oAYEcJDFlrN6
 AIgL4pwIQIDMBlT/F+I4O6QYaiNpE1yZE70ap224habCAiPQtPhofaPQzsFa/Jx9ylaODsTGkd4
 mUqlVQnrra0vphaTuaFRB4UBVhxpI8iG/7r8L7lMd+tQk+x94oyF6Yvp/W2SVtvaSnddvWiY0Ip
 Y0DNh82yQha9F1CoxvE5bwcygSRj3Ye/Yh95Qwn3/GR14Z/9AJoKGgLjaP2yPaSUppUxaraxS4R
 42HZlkEU4CFccwNO2MA==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c0e9a9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IXoLagY9VYqCqr7K_xUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99117-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B56F2ED706
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:27:39PM -0700, Gopikrishna Garmidi wrote:
> Add Mahua CRD board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

