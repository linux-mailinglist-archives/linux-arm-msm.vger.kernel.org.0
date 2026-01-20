Return-Path: <linux-arm-msm+bounces-89909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGwSFcQUcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:50:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A414E213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82FABB4BCA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022723D7D6B;
	Tue, 20 Jan 2026 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXbyIv2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtQtBrBh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881737B3F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950037; cv=none; b=Ou10mFg7+2OUvHD8AY7itlKPZkDBRBAPwUR4XGXueSuCx4KJrxMkL7Ejrtb3zQDdbIGfUE82g9xcKx+IasjFDHOkWKu3YVaMW+iTHkRnmgUtd9IvcSRlwu2spQL7n+hW0GUW4Jlf4EXtAPOchoOvowXSUj73HpwDqhbyoABZxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950037; c=relaxed/simple;
	bh=1DMeQynHScBJFrSHPAMedUNej5dPsXOwWFA6mNyJAGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5hgr6I4l1RrYp2R1cq4/4aC03XTNHN2cRdJarIEvtk9/TL9fbA50IPVHaDpJo2bRzZ1dt5mvXhBhdMMtNDdJh39bQ6q1OUCmXmZCVHljEA9W4HuRX8A109NJLbSSrur1m6To478Jjv4I7e5fHfJjG1z+StbeNCQsAeR6ME16xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXbyIv2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtQtBrBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KJt4WT798784
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hJiAggJDqoi1UxxXfJTxZFSG
	047MWQQxl88t2M8QlQA=; b=JXbyIv2UPpXC7GMlv/tEI5DqyBddK52CgvEu6JYU
	bgObzhNQjz4jdYuDUS0Un0KoEDZD8d5dEtUSFacnXMgDcuVwEZvhKOzL4vpaX8rG
	dLrfytVJmo178V2IqwEuV+ZGVoQcr7xGXPTakgSalx94k/qMzbM1HM22/H3rij4t
	s5IN8rSr6a9hU70ySfp9p/52Ol5VTliT8hum2XwgEQMLP4NZRtOQOH8eyjblbZb1
	pGeE9y+g+PzzsfmMI8Fm52abERapcz1oZdHew/XzdeMictLuQh0N2re0GEE4qDoT
	FthGPKRFtOmsbfn+sJMk5NSU9Esw8eixrBu2sHYzFTPTpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1y0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:00:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c921886so742411085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950034; x=1769554834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJiAggJDqoi1UxxXfJTxZFSG047MWQQxl88t2M8QlQA=;
        b=EtQtBrBhYKHPcs+o0ugb+/nGON/uIU4LTy/20uFzdbVFapkRDcn58IJyWgC4kM/rRx
         PWBah+0jTgXJQqxjvZ/+9P79kP8PWuDUAXs/QVsPcvaeRwbrtB3fwEf1xFcWv8kDbJSR
         /g+9Ja5HrVf9Rmq/LeobR/iUoR6louWljK5gltpYtbr3r5E4qYgQ1pMfMb08R3LAG8v1
         eGg0fiUaDWSvAAzQyPRYYMY0kSUN0qyIfFSpzfrvcjahP1L92P/mvDcA0BAIGStQGgrI
         188hrUmNawimPLFjohss52xYlECby51VUWnqtf8mROZVEmQzrNbpIiI8ojcLY0vRzkE5
         whCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950034; x=1769554834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJiAggJDqoi1UxxXfJTxZFSG047MWQQxl88t2M8QlQA=;
        b=wEOo8GslZbo28XFhRb7asd9mOGSvMoDaUy8VuhwLCTgarKwSHuL51ezh/qIyP4mmpY
         kl+r8YpOKO7xdXCUDMFVUWP2wj1GcV3XtaS0Tak2b/+jfDyzKuwV0O4A/0MggrhKE6yh
         WU2w7u9gfAdsAjHIJgjDBEK7sadWDDVxDjOedp/uusnXQHMybJWvJ7GexIWOQ3j/vGSy
         KNUuSk/6EJxKA13bj6q0Ke9J7YCRIYWyKfl4v4WCKWjaCikWYY8fkqhHIkLZK5wEozyD
         g4MkK27we1spnAaARIx2ROLlCSphZcLAw/hnooYJz/QgV74fnlkKQILBKpYddcY0PuQ4
         Hb6A==
X-Forwarded-Encrypted: i=1; AJvYcCWe2Bs6JPphj3VMdnNldgv7RaEI5vm2yyqW03TFod7upPFAVKYrq3fbHb2u3G1nFxZhHhziodF4KYD1mV+/@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkXT1ocr2hg6u/uD1HxCPelA3cehf1I6kqsmIIRfuzHYB0HkL
	9nQm/YCwqrwSra8O9OyRd+aLCqISEKGwYEJzrvYMyF/qbFnGuewyIrGPsjF0DLXpLObM38nLKPC
	vcncGokdBdB6Es64Q+rxUOKniHioj1frteC1vlvuP+fgzpOQ3mhSC0EL+k23bxvR/+fX3
X-Gm-Gg: AY/fxX50SDcyIC30ZTd4vBppXQxlzXGb0rYWSyfTi+tEOb2gFIgHzTKRuKvTOuU3U18
	Q0RE4VGVIJJ1UJfzyAICgJrqFWLVABOHlIUSVzuWrpKAqj3DXXXWOG1TycKkyVubGruqycAXIeL
	lIwJ7c6fSulgX6pLfCJ0kRi7tRTvjWZVKPY8SEIlQZlCUfFConNPzLSBgjKpM+2unE+fG4AXS/W
	LVUxRpEAjJgBsQpzWtWte0raRTLksyA7TMgY/z1tr3mOk+ypSri3QwlXF6YpoNPahtJ+K7R652y
	FsEobdwo0hjOaM9vJokTNg9xuXeSDsTLqkXsjvyziVZkckOn0pZQtLr34++TZlS1/DT9n8qW+IT
	glN08v7Ce1jqTH3A6wjR5t9TRto1oO2pFn5cgxs0cKFAQFj0CLDTvfju5sUfJcs1zT5iG8Fb/cY
	LOf1h6Ig/wiItJ8XhYX/kgES4=
X-Received: by 2002:a05:620a:460d:b0:8c6:a57c:8cf5 with SMTP id af79cd13be357-8c6cce95775mr392170485a.24.1768950034277;
        Tue, 20 Jan 2026 15:00:34 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:8c6:a57c:8cf5 with SMTP id af79cd13be357-8c6cce95775mr392149685a.24.1768950032550;
        Tue, 20 Jan 2026 15:00:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34dd0dsm4350213e87.26.2026.01.20.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:00:31 -0800 (PST)
Date: Wed, 21 Jan 2026 01:00:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] interconnect: qcom: qcs8300: fix the num_links for
 nsp icc node
Message-ID: <7jnd27u6qssvsh7nmqag6jqdy2aze2zc2wj4ti6sksf2rhp2i3@zqmw4rdoryyc>
References: <20260120-monaco_num_links_fix_nsp_ebi_path-v3-1-536be21ce3ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-monaco_num_links_fix_nsp_ebi_path-v3-1-536be21ce3ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=69700913 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxiL0x3TbA1XT9YnT1oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX31eKFHSFeeS9
 1uwTwWrj3ivNG1VwxcLzP88GLfC7TUihqIbBqzQ6ErDpBrsnPnGF/eJ3DV954HKo/LdyoeoPj6q
 26Dd275Dmsr5D1QJoLXCXVzJT2Sx079cMaaxC4KtY5pbfTZ2gkNCBNCkjzcjZ414D/lKXtLCJIW
 rfYZpMSGHhCtNWpzhaK73qxhdWClawgGvyDO2dIXO6jM+GzmpFI5LfXIKlbpfSxxxv+QeuPDC49
 yei4I1xzo9RnDz2M+5cninxi8Q6dBwA5OQy5hc14MQge0+oaOcmM9Lu8RmIz05XH2/nbjtUq7Q4
 zHI2XYZGT3uZtCm7VXCqkG1r70NNczPEnPsBzvEzQqBTICEzlN/D0ZgT2GCosDriV00isK6sJsZ
 Egyqbu4+l/9kHtwtSpEZja7fyyzpb+a2CTe9MSMqvBNSV5xhliK+k2xuJVeZAsj16S+zzCSOmL4
 BM73qBXjbxldC4Yjhkg==
X-Proofpoint-GUID: w0foiZoucFKIBe-lxtwZRFDpb4UrfLR6
X-Proofpoint-ORIG-GUID: w0foiZoucFKIBe-lxtwZRFDpb4UrfLR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200191
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89909-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3A414E213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:30:10AM +0000, Raviteja Laggyshetty wrote:
> The qxm_nsp node is configured with an incorrect num_links value,
> causing remoteproc driver to fail probing because it cannot acquire the
> interconnect path for qxm_nsp -> ebi. This results in the following
> error in dmesg:
> 
>   platform 26300000.remoteproc: deferred probe pending:
>   qcom_q6v5_pas: failed to acquire interconnect path
> 
> Set num_links to 2 to match the two link_nodes, allowing remoteproc
> clients to obtain the correct path handle and vote on qxm_nsp -> ebi.
> 
> Fixes: 874be3339c85 ("interconnect: qcom: qcs8300: convert to dynamic IDs")
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

