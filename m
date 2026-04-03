Return-Path: <linux-arm-msm+bounces-101733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGtqCIgi0Gkp3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:26:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9039826C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D93E303CE85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFD03D75DE;
	Fri,  3 Apr 2026 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8tvSY/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiFAibC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47153D7D8E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247774; cv=none; b=Kq7AEkjCaj/J9gTofwFkPdVArnvQYSRjRHiGizrovF/FN/y5A2JJK/7FvVp0oE4XowlghrcCHkc8mNrnpq33fDsRh7pr/BzZ0cZVarb53emF2BH4fXnDL3FbmO2Y1PsqE9o0CTOuVUEc/EGenpClQewSMZV+MkenM6BkW59/jfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247774; c=relaxed/simple;
	bh=izIZUsvbEAV/0fCfYRTbm3ulS6qw1DIy4b9hYSIb/SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDqRWb4UnQvwG7h2S0nBK41mAF+TfNoG7swaq0Ob/HXa2cCTSBhUbVyhnWv7kvYIVMIeYd4q3cmwbVhIAtbnfwAlyaFAjobeeMkxANp/ikpMZ3pc2NHnA9lkHs3J73pjrfdOIeMw3b0nQBuycHrYFQO9HBW7nwdfi2gl2gk+8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8tvSY/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiFAibC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633GFEej3449850
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4yDt06DKkjZYPE2ZQ7EPO/ds
	rviXxjbdzSBRuroEz6I=; b=h8tvSY/lEIg5f86ErkOrj+54LUrEUnGRTm8GX3OI
	AAUUcIhu8IvXk5rEaV9Mz0DjE63F/e6IADsUHEEAseHO6R8cpxgvM/tVToCC6DKg
	NxjDr8V9GbiwXZ0u/dp4HjFIYLud4+mZgD8i3bp442Qd+jOR9mpYFktJ3orsnI+E
	oY4ya0ZUOOWFxAyntDISdkmTCxhkgIS7wG84K+1Bw9fwF0/yvNUpIA/Wr2K92cMS
	B1xk1Lr/e/tqbIcctUw7uoK+K0YPPm4+owErCqf6IFU6A9S9w9JsopYP5vtoCbWq
	R2VprTMMxxYcZmKDf25fBN4fPpxVrUPFtYF45Id4wvUnCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u5a515-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:22:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc1634e43so246824085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247772; x=1775852572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=IiFAibC7oHHv4n9LsZLi1RCZ74CsSO9P/lLwrWom1tnpURTpo7ZqBZM0L7ZuuNk6CL
         7OsPr7/KOfegACit/QwZi27pqux2Z5XwnLkrB15QgYiwpPSyIYgqJZkpqQf1m6AM2LCJ
         rYiXYKyrO5uIBQWXbWRgmC0vVYGyzc57hFcdox7Cg7/of8m5Tp/Ne5C7exy6ULvokEYl
         /X6AjAKiOpU+NaCa4/FGfhPyQkWSRzvLisaa+KoHCi685JZBY0upjfO1UK23qTmSCIXl
         yMpf8bqdoQ2C39XjChWxPa4eWJDWAe5J3fBsBsY9J04wB+vMuZTi7xl3/ui/8wZKTror
         nIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247772; x=1775852572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=md66XHXpgRFDeX0IyUsZ1lLPrbAb4sxe/jYw3q3O27h/R1ZI0KYAHs+FB5kjs+cD8X
         YzHKb6oZnbmuPB/duBYyS4ZtgwwyD0DnjME6ZvUMbhVnGeJmhHP044DXsnRmBY/Z56m0
         dHVtxQouPqchvnfZ56i/itQGT+I5iU0QEtNg+8JSaGyYxhKlJ2AvjflIMfLnHU30L9CQ
         SMIRwNeTMMcHasYHwZ5pxRqpnHrrtURrgMDTJM1+2BSMYjlpVhp49FOCKEAv/qcG9vKa
         tIOM6b1DdLlBuAwV+Zec4WI++GD6UrH5saJFqZm0GFBqT4HizdI7ilmUBNTESHZc4zCU
         cUgw==
X-Forwarded-Encrypted: i=1; AJvYcCXI+rBKDbuyGhc2sl5eupEB6o5n84BZbujd04lAxhdPE5IY4eqB54DK5QMkd93hbsd/3Qw1MmHrTkSFtWJw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2NR7gBVMKiw9y+YkrF7eJ7/+ub+c2+4VLFaZEwFQScQarQzzC
	QDyIPJm89uND5chP0HPfry/1rwG7K0KkKudWWnGdc61PKNasn1b0GTOKY4eHYVAVwcoIV+wAeQR
	eRchqLdKyedI7QxO1tZKcLh6bVzjbn1BkUzLxdWl+Q+Q90HaAeuk8X49WZgR+j8DuBbyk
X-Gm-Gg: ATEYQzwOoFutx+f7cn2FdNW/2tC2vmZIbjJjyGYF++0+X8UL45sZWjXPgxKstZ+w7P/
	wewdnd2YsjV5rRlp5C2V1F5VPLrZizss9JrcdJhFpMdsxiT2MmDypopXn9UBZ6CIlXATxdzUgYN
	OXYPwQakgU5BVYczR1198XI4qs0DgapOFZnmcdxDms80KR6mSaSbbDy3fwkcVzdbyyAcYCPsDBB
	tOR+gM1ZxZWKsadivWNMaiRUBRNKn3T/ri+PrQ0hQuNYwkiWnh1W6Fm4wXfudt9pBu1Ugk9ohy3
	mpqAvyBajfzOCx1NkUCrEX0k8sw5shWz2Z5ph3W43u9qf9qqRgLsSwJo2n5HgrRizvsgJaxM50F
	/jBB1I9rGtj9YGKeq7m9upRyxVn5EB/Q0lXGA0XaTnNak2fsT4sdy/gfAJZQodaC8JaJ/OfStIA
	OHZJtwL4meaYH0YHNK8of/phaQ8/BYpqanF2A=
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237331cf.6.1775247772044;
        Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237051cf.6.1775247771565;
        Fri, 03 Apr 2026 13:22:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c97cd008sm1357566e87.27.2026.04.03.13.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:22:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Prasanna Tolety <quic_ptolety@quicinc.com>
Subject: Re: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Message-ID: <fnugbpprfyhisikdxrimmmumf7u7frjatjs253flet7xu26nz6@d5wjpz4hchg5>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfXztigMLtuDHsi
 +eQsElk4/I0GaZnl2+zurDWzw1XpMbjjkxgm/HywLCmhmOe2AhCb1FMD6Uo7fddN2kS9Wn8WC4a
 1ajKncgAQpfbRZ0LEyvt8SMHGbFGBYC4YemdXVuiNGe+WfwuLl2yYVhu8wb4LUPUbuStZ9ayZMA
 goxphG9AWx4THCFbqs50+ySLXBaRC8G+pPdLGwXAhLIn4Edm4Zx/ELfvKo5HXj/sTiGu6Yqj/W2
 RKaPqOBH8YhuCyEyvl75796tp6/vbNRDxo0ReCW8IgWmVNh6UHgQX/yZ+pldiu00wJUgn+b7Yt9
 LcNdashs3k2iyS73TAe7tq6DVf6tZflsYGpLfwW4G8msjK+HLK/zoQH8AyFgAQQaNxondlwdYR3
 RFakppdIK0uz0qzzPo0QnnKxnY60HSQ9SW6NAdbfGQ5hZQbxcngXAP0ScpB/RR3WKhizW5dT+cp
 4Mim1JrP1UnADhqmG6A==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d0219c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BqJ7pa9g7VlX8Zvc9WEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QOFzpHC_5scbG1b-qKe45dxQQlJej5vX
X-Proofpoint-GUID: QOFzpHC_5scbG1b-qKe45dxQQlJej5vX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030182
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101733-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75E9039826C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:10:53PM +0200, Bartosz Golaszewski wrote:
> From: Prasanna Tolety <quic_ptolety@quicinc.com>
> 
> Add RPMH clock support for the Nord SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> @@ -1054,6 +1073,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
> +	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

I R-B'ed already, but then I noticed. Please keep the list sorted out.

>  	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
>  	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

