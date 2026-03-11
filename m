Return-Path: <linux-arm-msm+bounces-96909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA4sFpAusWkVrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:57:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2225FD6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E08C305C278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156413B3891;
	Wed, 11 Mar 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmAqE5Kk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERPRFmuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C09304BDF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219130; cv=none; b=lpc8+YHbRBGXgM8NhTrzhWkd0wszlrhYfrLvbQkrfq+C9yY7oefoDkF9wxlZ/39wGJL3UDVzGnU69VZDvvi8/YwAGF0h0qnAalZd0+wCLe5V3fMSXOXeMTh4UhRX60A5qw7d1mFhbFmqj7PESZs5QGVwO2378GC3zPZQMC4TEyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219130; c=relaxed/simple;
	bh=Zmn+P9TvvW66lOxCmrgpmyYtnJH9ZPcVtAGdkL1Ht1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACHgQ9mKlLz9G1PVHTFKVwyP58oJ0ggGsCkaLQuqmgZRlwJblzs2yRCzG2pjh+iiu88Gf2GKuUM3Wle647l3GkMZXzOiV9Om1oHTxp2f3K7KRPdcG7AV/t2CmLNIe17BEFcd9Cop493cVXC+WTKLiTsSic3BxSpLIP6Yq1NQX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmAqE5Kk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERPRFmuA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6hK4e2677070
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cdvjn2wr9LMxRbN6RxEUaAKjqJoM6H3XR4Bc9cAQS/A=; b=SmAqE5KkvGvD6Vnn
	8t1Dffd1rcjj6Piwt5AoYaqyhJhNcKoc7v7MzbnxegQRlopuE4XGdlRWO7dxnZJk
	NcfKaqrmnjsrtHlzRw2dcsW9p1bw+Zwi83dAeWvA3rJFbEwbLQUGw1w3HQgV0OKO
	yPBlq+ve3Brp+W5IOwDT6I4FjpKbyBw33gx3xPlpi56SCblsqYlyYCIKhhknnXCx
	5XCU52SLtadDekufsovVpF2gyWhDwfA3cwsScwq/73DQWLNLudfjJCXZoehothWK
	YoUVZIRvBLkUn8Z8ExoRK6HyJzO0GD4soSRVinf8fuM+eYDk/djPZ/9ADz0lU+HT
	WTLs9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0f3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:52:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso101910866d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773219127; x=1773823927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cdvjn2wr9LMxRbN6RxEUaAKjqJoM6H3XR4Bc9cAQS/A=;
        b=ERPRFmuAeBk/DMPSSsZWkqtYASDcLKRdkDnrO15U3MgD5OogEQKS2rCFHo1YRrrth6
         h2MFDUJUoV+bagJ1xKrroy9ZhWzgh11OZSvjIpL/HJHECNtVaTSCXPpq361N6uP+A9ri
         wZiTgmZdSlhzUaSuD4dL1yjLR5y0969owaxCS7gvjMRPGMns7hnyCMPihEFwCX8V3mr3
         dr8fkZIM08cgcm7x3c1Iq0m28tYUgvKk0/3n+glSBTRIMxX8QpTzmQ+Vm1g+PhwCoEk5
         Ahi7HkfyH7syE0lkCJBZu3ILfOgL8dl2MiEYwule8HV7PSmtEbRNYXwuVxyRmSbOmLPb
         CYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219127; x=1773823927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cdvjn2wr9LMxRbN6RxEUaAKjqJoM6H3XR4Bc9cAQS/A=;
        b=toh4INAsNMVmri8B6clA/tw3ZblEnFQbVmSBkdfKJecNjB0KU5FzJib80olj26TcTO
         gK0F5aEvWNXVbAumaYLEplxe3mkLPOQgf5/+QlPPd/h7A0qHNCB2OSxTrDLhhKg09E7L
         Dwr1v7lsooiaQvqpus2jtQlLlJSLcVyNsGsRLom5zw4hDhcFRFGOXRXXt1dC7GUyEma9
         eSca028HnzhY9UDl9xezuxnZLACUEc4WXLx/QssTX/8Z2yxHJSBxRminWjRQvypgcbBv
         sJPBTh/zSOGlcwoaU6jA6hwRlgPlk3oNrA5scunoA07OOlbQP/Braea91Z1nSgd24jLQ
         h9pw==
X-Gm-Message-State: AOJu0YzadpqhguMWvooLjD78sYBfEI+kF4JNCJSVv/5Gd27U/eioUZ/k
	36SiWrjvRvmfqSpQsMKjC6ABUZJI1eyCIAevtRgxaTOwcrnsdQTzJk1fMkxyQAC3pvac8mY0W+X
	4KlDCNkUNxN+r4V1uNpw5jzqTHX62mP7Q8Cp/tyI3ICN/Pnhl1AevkqrtCH1bkI7frRfE
X-Gm-Gg: ATEYQzyqJAduWPSCloScqt3F1kAEHA0XKPEgGm0nLdI2VVnPgiyh9+hF7RB+4OaaSiR
	fP/xGNY6fMmSsrAwCClkPWTvwd+iAhlLJe4PbOYqi3JKReFDUVNa/zAp6zTPgX/hoEuzof5KVKn
	OwkEDPE6S6FQnCfeCIEvyqxY73/1RXba6e05IiRgihMUV0Rd9vk0Ds5H7uRCBi9w+hq612vlJZR
	epOsXWC6z7Ma6vwOHT4l92HgwT6Qg9HS7FQBYeF8N2QJhRvqZeJ8Bh2n+Si7f+Uf8MXQMJh4iUQ
	GAWyJ5IojLoZq8pLjJIyEXrGaN6xBDW+GRKDGgWU+ojiadlmSo6ZuQmkAOFuFpuCKxgaX4g5e/r
	6c9R45I5+9fUHsxhuuz2n/n+agNDr8cUlyXoD3t7gNghZ+6D0Oj+OM+GqsnqOLzwPrm7LXouFQ1
	1Gj0c=
X-Received: by 2002:a05:6214:5e07:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89a668804abmr13662956d6.0.1773219127370;
        Wed, 11 Mar 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5e07:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89a668804abmr13662856d6.0.1773219126998;
        Wed, 11 Mar 2026 01:52:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e185269sm36493466b.50.2026.03.11.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:52:06 -0700 (PDT)
Message-ID: <a2040800-3687-4289-a232-a1aeb6ee2558@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 09:52:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/25] drm/msm/mdss: use qcom_ubwc_version_tag() helper
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
 <20260311-ubwc-rework-v2-6-69f718f2a1c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-6-69f718f2a1c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NCBTYWx0ZWRfX31piXbAHjwIs
 XIXuG020mHnUXD02Xzz8+/s4P1b1Aa3ByX7DCMdOzUg7KiLj8PMO3COfiC01aoy456Ge72Ycf2G
 1s+1u7ZOkwDwVJZ6RuD33wEI0284PL6GhtCkbhZikzxySGPHa/4TS+r5hzvwjznz65+krEjKGfN
 xZaC5skxx3ahSMxj++PoTrHx0QMO2ABFPHxg/kOofJd8xjtNnafQjv3iFpU4Q04vwYx0Hl57Yl7
 IdMiO07racokrXboB7v2Mo6ShtjyK97rcC3oQchyX1SnAM24Xp2/izsNVD6FTDE6xS1//1Z2lGk
 HwxRE7dyUf49YaYug4wg6dlgcx/jXCAH1N2tzX0LMNIx3ZxBejQ5e+hGe2kUJUguJf10eTBAcPU
 gWpu4n7Uj8V3aCtYU9dAq+jtOHSDsjUtBuvgveBuEDrLtOWBz68MZYqswX2yBnMHg/2e7zAAtBl
 3J8NsZdndxXfsogJ66Q==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b12d38 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Tplt0obVJJSInWYJ_8wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: zHzl66CdZfRT1MdYmsgvnJbefhdRfwJg
X-Proofpoint-ORIG-GUID: zHzl66CdZfRT1MdYmsgvnJbefhdRfwJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110074
X-Rspamd-Queue-Id: EFE2225FD6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96909-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 4:23 AM, Dmitry Baryshkov wrote:
> Use new helper defined to program UBWC version to the hardware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

