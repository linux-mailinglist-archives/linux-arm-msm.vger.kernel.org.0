Return-Path: <linux-arm-msm+bounces-92989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMnMCjU2k2mV2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:22:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993114575C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C6FE305C8F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5563B313547;
	Mon, 16 Feb 2026 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/DVcggG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpA5ERnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6830EF82
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254529; cv=none; b=qtkoXZOIqAN0gEvgYWwN63S5QjQrGip4mE2I/zrd38U9jVkyZdkXYJLnbMwi4aOqILU8fj8wo84igWTaU+dYofeOKOFK1CR24gVbQDa44GH6BQQhTk+xx7ldWM8gxkubjVCmRqDk31LhQ2XZMNyixg3At4GnbEZaBrPdw4yXpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254529; c=relaxed/simple;
	bh=4SoLAHTvcPqxmv0YowTSoM31RJjfqFp9kt3MUAd2TAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLMd/sJvfwM7AEv+TDUgYruZMKGKjOLrXIcNAKBeXvqrRAF6Y+dVr+aD9FAXMTQiMzJv4E1ZhkcbB1n+kuan1paqnopmlD1x0ldDUbKG05eFv0W4g1iGF4Spyy09qJmcmW3Srn2kfecclXiT9vDkSMRIxP3PNEIViWG/tyJvPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/DVcggG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpA5ERnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBTLHp3542176
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=; b=I/DVcggGFuT8Qe20
	mXhYGh2IVQWR27rqQupqMXKjiXhGkscy7HYN1v4IPX0gqu4a5RlMQhXPNHT29R8u
	wy6b2tLxy3PAZIUb/3I3X1tXyfEaglN7BkIiInrdwzR8Kchh+BqnXQU95HEVJ/k2
	A2LAEptPllzf8yQ404qTbPAcNssRTalBUjTqT4/ndEsESb9sJ8ZsAzqOzu+R/T4H
	fDm56ywGDfCeqvfJv4ZNrXMsWuQjj/eN+I5UPJPnPoqx+Wa8b2cAsaOYkOkN/GOR
	ohAzVqmnmKDLbuik+o2xGxHNweQep2WdlXnrv2lKbNm2KVBdBmfYAG7FkW2CV/A/
	XOssfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jcsf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:08:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so253063885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771254526; x=1771859326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=;
        b=dpA5ERnboOu6RqnJvcBc5A/w+ZIF3XYvV/+b/Chpsw6JcXwE5Z0fQSD9/iWeqhPNBq
         lSVD6DRTU92C+xHMRtwO3JCs8Wwh+StLzJmuHRD3oQilnAmyHxNwRCT2T6k7RNJ/Du5u
         UpG1D6OK4Wc72F9IhMu/FjZLGVzCf1lE0mKb8jGEV8YhLFDehKrh6MKFgBrzUUe86x/i
         PiywBChM3siX1A6dr3B7LH8N6jYxvT/SulIPWUGT8BQC9XgE2BLJRQRrkDn5Hkh9KzVI
         IG4HYc/BUqJme82pnssSW8tQhMbaE4z+lR5EGk8hRwPGzo/2G0q3gdNjr280eYAoLcxP
         Z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254526; x=1771859326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhCX4b+SuO+iSEOO7ILdiZTUSuMVKlPQNNXw0P7RuA0=;
        b=WZlDqPNSUH3o0fqhOGXQ7oxejaxbI3W8CQrsLJR79bQwSR516ZWinnlUsrwc4b+yuz
         mD08aZu8vbdfDKM6R+kyY5FFUweuNk2QO7yXjNYVtnkZqPOhQIQwY84FKExBfTnYiX8t
         Cc1y68JQ7JlXlrkKIYWwJAtJdBfSOljlhdk0PNKrfjf8G88/p43knf8TxuB2k17yKIRx
         Yilk6Msn2/lfJSYZQznyvMkQpECSksTdo4O3RlmAyMvKoALGXYtoB1cXWy2mCc4yppNv
         YIF55WeayO1BBWGQSZnOxPp5mMSiiEhOhdMKMlTSzzPpz/c82KUodh5q4Jpucbnkffk4
         ncNw==
X-Gm-Message-State: AOJu0Yw5qjjksn/O+gKoGWbFKv8Rug6rR3FaLEhwHeQa0CWs7cU2MJ/s
	whMAzem1dGXdkx96JVMsXypAeJU97WROA3QnWGbGQjMuQvhnqx0qT9Vn1EqGWvGwLxcCJrTflJT
	tUajTLFw5hNRKhY0YQZRZ9jxN8XD7AOQ9lcljK+tsr0sZgtCVIZBggzuEreTs1cpQ59hc
X-Gm-Gg: AZuq6aJGC+TRlBRPf1AWVj1bfMHqeb+5uFvRvEnoTmXk9Lqkz9kgpWS3cjlqDtb/dcQ
	JbyPt5IgDeyQSxrINDfVt+5/flka7YBZDVWv4JYw0nYHEtIJSmUYBkG52ECenuA+dWSy+iG7Wqd
	XFaHUHN0bGvahfXxP/adMgwUzgfyupijVJ+54wqCiCddFtBvujWhxuDt8zn3fLfH4AneP7+gYCS
	mHym6QKXLA5V7wf/9GxYP2zPMhQAXjvPBCf0LkKaoNnoF4h9HqBQFvBtxZY8EcxuzlHyfcpyxgc
	UNO7UWzdQ8Yaa0+SSnfqr7wxgf6fmPvBGxDLxmo213FqAPDGFtC9eRCM0SoNeBpiMg9bO4gj004
	q839bw/Dys00bNY60EN0ghwEvMbrfEe/ut+d6tzxhIJSGPtLqJ2jFXZUmJ1jXxwx97GvC1vXIR+
	Bqx/s=
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1079997285a.0.1771254526574;
        Mon, 16 Feb 2026 07:08:46 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb4073e264mr1079991685a.0.1771254525954;
        Mon, 16 Feb 2026 07:08:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fcaab2e0dsm253896566b.18.2026.02.16.07.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:08:45 -0800 (PST)
Message-ID: <5edcdb06-837d-42bc-9a5d-91b87e19715d@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=699332ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=z393bjM37XPXZEtfGisA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyOSBTYWx0ZWRfX/mFlE8hFlXvX
 Y1nQWh8NI9hYLY+x21pmuuYEsbVDB3WftqLhn5g+5REc+10OgE/DTTvCDcpGoIfUezk63MMGAFb
 9SrsWbSwRDcbruvdxzlXdBFFm+dLuI9oe5qNwQp9eYfhkMqwlmaQAQtXlMGRnWNBIr9OJ/2PAjr
 yqkD3y9vVGHgrSJlfc2AMYetfFXGT3essELs0YrDuh09tAR3ofXCc51tL/kbHJhbO5mPWpfE1ZH
 kJUSBVjssLNrRSXRP7F4aWl3Cka3a2OwNHbfN5+/C1spZZoaLZLrPjvdS2iePrhPmHq3sBOc9d0
 NT44K3NXv3/4nkk47V75Mv+JQ1MbVrvl+BeuybMzUjuwK42ErBkyja5Zpn0NkYfyokYtSbgCiiH
 QYtFIdACATAuCOMPjlFsoWUm26dPIqlXOc7Y/CRPjQX/zpwnJRVFkx+tdcfe2t91OfSpjuFKJpw
 cOQ080YjOa7MsepTe+w==
X-Proofpoint-GUID: 3tPHzMk_7hpJ0f_54QdtwNZ0Lq7GN0Q5
X-Proofpoint-ORIG-GUID: 3tPHzMk_7hpJ0f_54QdtwNZ0Lq7GN0Q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92989-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9993114575C
X-Rspamd-Action: no action

On 2/16/26 2:43 PM, Abel Vesa wrote:
> Add the TCSR clock controller that provides the refclks on Eliza
> platform for PCIe, USB and UFS subsystems.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

