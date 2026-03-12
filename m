Return-Path: <linux-arm-msm+bounces-97216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMhTCle8smnzPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:15:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B92725A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 430A13006D73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7A4364955;
	Thu, 12 Mar 2026 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFPRkdLR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUUbHZL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EB3C5533
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321260; cv=none; b=cPV0I6TzCFHdgiNwRZPjqhO9p06KKyclJjgejpQl8LehgdYMGmwucPJauEYM0TxRzXXqlqp2iXsWKVzopuQveY3StMuuY9vwr8pTacE8y4ZIdlAnlzOY1cX3AQxwV9Wrzv6ASWDZr2occ5uI7i2ms3lzw27/2NSin9Izu8yqVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321260; c=relaxed/simple;
	bh=lADvAkdwzYDQIeDSMIDb24gKZEFFt8rTzV7oJZwvw7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPuZeotRbJ7bar8JnYT0XxZBgP1Fr6gBBKO2+iPxEekwE0m2H8VilBbiqncOW9UjVOpwvx2z+Fjj4Ia4ZHVI/Ws2A3tt285OwaLF+JjkqsK8OICWe2YSOgwMJClOqVelCQQspXxVWwbKXg+nPNnN9AW21OCdeD5R95IpOqMo3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFPRkdLR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUUbHZL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9YdHi4025894
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aO1+YvVpUh8Bk7mDTuZcPxVY
	Iyr3Lp4OCqgImEJYixg=; b=QFPRkdLRXjxVvV3Fij4VSHlySdXb8txxh4lInEYv
	3T0uGjkTrRfzxbHKSrHaahpNrjxS3rmR5vmHjdC6T97OMZCv9+vo8c7EBxL4+HRu
	6nPNjtUNg9X93SMPC2uf9J8xy9glUR/C+We1ZuR53yPwe2i364IvdUzFDjIwkh1C
	atgZ7mLVwtOz9HsCykbE8eL26jlGgGHB/NayXKSs4Mz4uq27oeFIgnYLl0VMuI55
	jbd6u0NSzfANClWpMF7tgMQtQg58C2bLKuFW7rBqxszkwMJITX4I0Y6Zwqob53Vu
	K8vm6XJb23TemhwFunuEhWDmb7TgEpHqdeworih0h5MKNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50t513-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:14:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091ee9f1d8so92513391cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773321254; x=1773926054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aO1+YvVpUh8Bk7mDTuZcPxVYIyr3Lp4OCqgImEJYixg=;
        b=iUUbHZL57+egtm4uga7vXmyo5f6t11e+dtlQmpv+OlpoxPe0A2PXJ2Tj1OMT9Nf6IJ
         LR1ke9v/nBEmvMNrQzYAMZfUQMql9wW+NlplJ9SFfEUTwSZgzZlTW6CrpbeTkMor89b7
         P1sHkTiiS/jfbVRett7T4IGR4SueimF7U+od4ZJ03pYK0I4vfnMXzVrDL7Lq9f6XxHcR
         fDbi88T12Nxew6eETjEMMbBvkeS0IGjmYSPbi/oG9rHLrAvO8dR0ZNwxL8xaRztogOSX
         6jimqNJ5K2axjZdDMe3z1IQPKVvGoiMXFLB+1E0jd5M3KwnoDrU9vDYVO0S1KGgVrpV/
         O8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321254; x=1773926054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO1+YvVpUh8Bk7mDTuZcPxVYIyr3Lp4OCqgImEJYixg=;
        b=YuLpsnYd/7TjA8ZbHJjDuwm4qz8umakGvR2qv7lhyZkXE4PZCbtJ8BEiJ2N3tO2jU/
         GTJLNKLbJe6iCPUEMUmDpebjAzGQqRN0J6nd5cUyjDgXBX5pe2gzIUNGvrEiOp/+8TzG
         KJ+D1uiYlo+rI9rrKTexd6BOi7TiDl7zEpjtTLlZ8mgGXCMNnd4/ycE/r7NuSQUyeEeO
         BB9gC4LBKnsU8HNOD9r3eUqnd6euLrKKBc/oEAGYEJ0j4VxL1wwPc0pAENmqbhweL/jU
         mUDdtjtv9P3zQ+YvfUyPcFeNlIi29Vrvnh3t98NuMQ6scWqdqV+gK0TG3P3lFm+/ZwVD
         MVbw==
X-Forwarded-Encrypted: i=1; AJvYcCUSEKOedltiDhhNe+E/u3N3PGlA7qk0j/jvDSeNvUG3B3jttO4/txoimeNCT+RFTaWxssMEhmROdiv9D3mo@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgU9K0sPjEV9ZbU/WpABymoDOTDt28ynepoA0Q//4ncqGRrgR
	1i1H1ebPK9EumIrzBHsOeQePrlOML/4RbEPX9MwLjEHvoC5AluWnaQ1jzcAn8db3FyE5Ii0QHGz
	fTxibw27fhVgaPP/NhrCR2xjPdA8AkXCSMd2mW/tQ5wiMcFwmRzStpk8Z5I4OUEyXabIx
X-Gm-Gg: ATEYQzxvFoRJFc5pXquk/C8ZtdZ3JNk1oQfaSvtmk4tl4AjRp0bAL1d4VAt7P3z7yRq
	W2ckYcXvBcrxXOyJAFIcBGe+h02ltgF6N49iS4W1I5hksPZqyfmy7t7SpX0VnPOWyYaW10SIXsA
	EdS4EvNIqBvySqNZIE27G3G/0Y5+N8Y8p5cy5C6kY5CSi8WhDPMXb/I3ZsHjRz/evU8ClKhtEho
	nM+S3XG/cp/+xafLKk/pVo5s4E8xQ3trA7zroXJpsu2opYooQ2FDtIgv/s6Qz/eY2U20FkD8FvO
	Ea5JjWMax8iI1ivCE3jeTU26Tz1kUurQZEBwobTVzEUtk7qADeDj3cxwdYPcETa57RLdB8X+TY7
	Jx5S+EAU8oQf6so/f+0EgkwnDtAccitPgjEaejZMceKj/F4FmLe7Y0bkc4aLlad22ckOcZ55eq6
	JQ9kfACAE6z1VK2cnWHiODEli7NTlwsoRdK2A=
X-Received: by 2002:ac8:7e8d:0:b0:509:1cc9:8a4c with SMTP id d75a77b69052e-5094719fd6cmr42681151cf.9.1773321254585;
        Thu, 12 Mar 2026 06:14:14 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:509:1cc9:8a4c with SMTP id d75a77b69052e-5094719fd6cmr42680661cf.9.1773321254145;
        Thu, 12 Mar 2026 06:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162feasm954937e87.55.2026.03.12.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:14:13 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:14:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
Message-ID: <vvwc6zu654wvphlsgjgzfjvkbkjlsnfz6nrdkunvuxcbmguu3l@nmor2xmbla5l>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-9-val@packett.cool>
X-Proofpoint-GUID: ne0UlSUOSgBZkqwOzfrCQ4JZ_rVXiou2
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2bc27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=r_lsR0YksWOz7yjZoXgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ne0UlSUOSgBZkqwOzfrCQ4JZ_rVXiou2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNSBTYWx0ZWRfX/ik1dQZDdPDL
 ymbN+fJ66PXom307C6wKNn6qlsqb+oT33aKXudPrLoME6LBthKB8f9nl1sOOA2p0PdFyQabmeXv
 rpcoKfnZS70rTNPplui/IswRQx1ifcQC+ZYH6Ig/M8St4TeCefKGEH4llVL29u8Iia34SuUdJh5
 5pcGzyWR3S/jSuXT7Qd1vb83vhIMtGNrCBFqJ3glS0LyTELuTbNsgq8jeQxtAiCeUn06i2EPwv4
 uKrGLgJrdtaD5+l0EQePe0Cr2RrdKSVsl+zA+PLXpCmoocGXIKWJ3cjzAuRqYpVjXoKi7yYCvGo
 ks0X8/PX51OJVxZ4GYvgEyI5PDz8pdI4U6d9AsuDp07cwk+bk85SSI0eV2EA2bFcPCUAQEP/7sQ
 mJZf8L+RjGd7jkdYiadFyI6mwaRmcfYf6LSFMaWSzQcTC3kG2eCXnzyBt7tp2rvrgtvYg4QBWFP
 N6DLMSAyMI09TZ+OGMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120105
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97216-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,marek.ca,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 283B92725A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:13AM -0300, Val Packett wrote:
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
> 
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

