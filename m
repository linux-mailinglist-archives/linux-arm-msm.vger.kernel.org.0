Return-Path: <linux-arm-msm+bounces-102377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKPTHErr1mn9JggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 01:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4AC3C4DA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 01:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2651300B749
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 23:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5589538655B;
	Wed,  8 Apr 2026 23:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5Znmiow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uuw6a3nU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A938644B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692615; cv=none; b=V7ALl/Etf3Gat95lGLB4qdvawrxOEWAZs4HQ10Uk/cnLqYv2/sXqSP4nHHVGTpee9iD7wwEbC8A6mTnqmM8fKXOGQxBvvKRpTJ6OfpWqqcwFxUr9K4136hLmxiTxJFS+WcqWM/97osb4F8VRfElyzXdxW7owXHTUFvVanTIjutE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692615; c=relaxed/simple;
	bh=dr6GJIR/Sk4c890b88gB2jAai013600UA4EyAUN10EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quajNoOwWQDJEOvNo8YnrrA8ssnnnSknH7wZ1BpUwG4PjSvXP3bnP3byGztRwRB2RVfT7GRoK6L+oCIq8HPBkKzSsZe0zZOLHDNVrPcudO8VfyLj/ioSlhOvmEy4DTGWPLfaWxGIngdfTlf4KxaiUneKMqAFccpVNze8f26XhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5Znmiow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uuw6a3nU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L2RLk2619001
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 23:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmJZs1lr4C0E/fyx8Dm8giF+
	ilmdDMzXxhoS6JFYuJg=; b=T5Znmiow8aV0pLtFY3M04bO3SGd752eNVXvZpbvT
	WxNPIFVr0nzhrI2htN6XTj4qQ7LpxHVZ+hf6fexlGVBQQcS6xi5p/6z7PN0a4J3G
	VqKM7D9WNdhUQPmEU9bqj7YuiVSEH6zO4XzpPU9MTyXdHk+hHFuJWjf3m1TEHi2t
	SUXxRsOiX7FI0qmZKQMiq6w/Eb8BvOd2Th0ZoNNhaBLzSHuTorRMeHsTZeMPEu42
	YBWP2rN2SPInSEXShSDWskOk91zEfAqfLQXJKatg7PqMvnF77He9wtFalEbqaOG3
	9sV2Fl18Q3YeTLj0qJq2U3NoxnKutRb+kIFHxkLBnUD/IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28sp7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:56:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso25999485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 16:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692612; x=1776297412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=Uuw6a3nUXQPUp2JR01kqp42MdnGijfSCeQYmHJvP+08pEu/eLoOZieNXWXo+/zWl90
         YisrBnLgIV90tyFs4/x4GQc1ITi50APmemXrjrDQ+XjD7yIW3xZDDZF2RwgGPZ/lbU42
         /XI8C7GxgZSSUBGjU3R3AZR5dzrTHcNnMvb8gZT8tAXMojqGTkVuqCDRwS8un52IWGkG
         ysiey3h/uFdnzE2BH+C6E7klxkPYNMLfPA1gqBZ8OJMXys2Jufa2uR4aEwoaED6qS1pV
         ecR6bbeQnU8fLy/gH6OfrLQEHx1F9BDlZ9LkL08GJZP2NINkn45rJ8L7DClv3HfSBRlg
         0Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692612; x=1776297412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
        b=oJ2DQvvjyjfUNoxfPZMEZhdhaeTsSBFh7uwv3PiyF1ActC/EnefSEuWXFgtpA/9RCi
         gDwakr1FIuY30VK5HdwEDWvV6zzQpsDLAAn6O1neIwk7BuCLGETivVYQiiabImifGtz+
         onG7HNGmKuwGMA6u3QP6dSQGNLa04IPjkEZzQ2VUSJvJOLdbzoopbjdDxX5TqrSGC2LV
         Kpaqob40Y9+DOdMvC+HzZu5yyeFPPHcUZm+vcn2Ku7t/98DFqpu4MGtDtmkVLnaJ0TPX
         13vwe0yov3yHoqyiqhojEutLETvpbaV736r1YdPoOy+mhW4bbumNXSsryWOP2CjAl2Sk
         kvPA==
X-Forwarded-Encrypted: i=1; AJvYcCU6gRtbL6RQc3vADne99cop5hqOiVcNHbyYmRs7LfE27+Z49fzDKePFKRcxRzAISFa5FFHDdP3oBldLqSeE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtgm17pohGbHXocaOoLDT60y8ne/hsdjbyR6f6TgT832cykyUd
	ZJ3xYBKotuUjO2jTyp52Mx4SiSGQHeBS3PNgbO5TLh/7L+rJICqFCy7mxfXl+GPqhJ5SR6+Awjz
	xIoJQX1XWggwZLSD0TfRMCNiDWvmL3xG7pvjDrwa+GfUklgNu3QEq6AFXVAeKghd8eQFt
X-Gm-Gg: AeBDievwadSV2kBOMzbkPZ+vbgm1Z+87xKvu/FJj0uLzQ4hx6aOfv6M3T6WbdXvjhYN
	kU5ijjKeAZFCDwLOociYFjASPbseKC6FtLDJDcP3wFtaDww3zgDgzXIs3Sq/+/XHqfANg5c6cHf
	G6+0UCNDfBhv9FJzt9nx5ynqLVVSvT4UKtvQN4orbd9cjyou/QSb8qQT37xGCDZUmNcZvhgxYNu
	RDUiA6TQopDc8mGlRRbiXXNdN6qQJ0k8Ycc9bmhr5kHveO8c4wAwJIwN74fStjb1I+jn6JAwgSi
	DTjMWEfWcLzHHJjNnQYzhESeqeQWGFx3G7Mgyshz7R4pcaY4wK3Pvpfuz2imu0hu9gtsfCsZIQu
	x0hCY8NbEqcKMvx8kvsp5uEITEctYl5qeTY1Jx8eiAW9TUNxJ08ZHb6auroT5MqyjFMM4tZOAMA
	zmxRqJAzqrks5o6CBJD7XqwdwtMbt+FI9qiqg=
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270166051cf.17.1775692612250;
        Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50d80ee3b4bmr270165691cf.17.1775692611794;
        Wed, 08 Apr 2026 16:56:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9517bsm4981220e87.15.2026.04.08.16.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:56:49 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:56:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <fkov4nsg2ezs3t354t6llprxymx5jolqce3wxewqwzre7gn26t@lu5xtuliqq4b>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
X-Proofpoint-ORIG-GUID: NEY4QpspX5TYmaYRxi94nWlvSUB1js7f
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d6eb45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=B6YNfTnrzVbQWA5GCYUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMCBTYWx0ZWRfXzUvIdQtKrP+n
 m9hT++YETX9w+s+J1KAwn2KXypab0bmPxT7UHXkG/pueXsPkpeX6RnjjSeES9+Tp3+5I7aq5sWz
 InoD+4VKfB4n2dgHBbaieS3g76zVg2Xwfs2ciW2bvuS/Qu1QFuy30XwYuJW3j7pbOVOZjme13Bx
 W/rSFNwTv/sqM5C3gDB7EvB5ee7s7fcc1X2wAUH/IhIZxAA2D/fCS6Htp8piDKthZHjPziKOS8y
 G6CFXAYN1H3XPV7kDSrsixvx8M5pBC8KJwjJZ8R8i/CMM5ndMEuJId6PpLLP1aUC6S+3Kmuac8c
 XADlbCQ7ZLqtPM+3j2NNMu58DGNg4nYkUc57Y/Or7pWTsPn1irkKX+zvjSQqWlvv0Hc/ADKjSR/
 EdKKWg617Y6r5RLDbSB0QZXNTsR/XtSyJbz7jETYJ+cjqEUKFfUGHdw/0C8eAC9ZnKZKIQxRHuX
 euq0yUdhO5y0j/y0kDQ==
X-Proofpoint-GUID: NEY4QpspX5TYmaYRxi94nWlvSUB1js7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080220
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102377-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF4AC3C4DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 12:15:54AM +0200, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

