Return-Path: <linux-arm-msm+bounces-94354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JJrHEXgoGk4nwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:07:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2A1B1221
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF469304179F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 00:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E644019F135;
	Fri, 27 Feb 2026 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSl6IT1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDAMQGCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5520199931
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772150848; cv=none; b=qxjf32p4jZvUJSXSrsiZ+IH1m1M5y1O06/u25Hg76ce+07UP9Pt1uwo+lMMOw4QauSt5e505LuKFLgswW/h/OrQW6o4Bjsf8MQlDRX2kVtp4WvaMz12tYqEVqEeNUGGpYEDUtTPgGWtXr6x0NBva6lW6+uUvBxIXTmCgadjYSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772150848; c=relaxed/simple;
	bh=wNGfels2kdrhktRD6V1h6qL1cc8PzEi9bY9hroCZP0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+RkWOVTglg6QYbxf5j9TiMQ0qjuFTwEq6/8N/cyHZhsrtPIVvH1TUdMOgzXYFQJSHmQJqgA2Vyrs9l6t4x9e8V1WGxT9MN9vsgM4NFC9ikPIBOydtJEmni2VZhMmkIU6q3MyETeWZbP/DtFp9jzm+wPNf6++WJQrfPQG5+WWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSl6IT1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDAMQGCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMaj1J3296852
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+bVor6LYXfxmtccDaQIOzpfZ
	axn9rQCZgEET9kVlVfg=; b=iSl6IT1DxDa7HrPovkii6j2g31ivVBdr0dYVq4Kv
	Zh0GAIBJo+tL2UFrqAhRlSRXQE9ai5fyMARTUnm9t1pXo16vwLgEpzJplSdlMOK9
	PotLbMDZD9IyjcfEdulZY/GVjKQlN5Sc4yXscu9dPzOeIzBt/86dKLZycFk+RH1f
	bDzPUlGs/R6iQILNfZk492XHCDAQrJSXw1Og8d6p+h5O8MuXHTlz6Pt05jVKHli5
	pI2O42kQXOEhmikSZc/BNMHUijXWUN5f6uz4hDY6g83k7X+bp7/6dNwF4aErG+Qc
	w4OXaW5L43gWiheoUXq+/oVSMh2z+5TC/L3/oyAgCGnxJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y9gpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:07:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so825497585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772150846; x=1772755646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bVor6LYXfxmtccDaQIOzpfZaxn9rQCZgEET9kVlVfg=;
        b=KDAMQGCsCUOtHR4ppQJqVAk7Jy9Fw7yBQj/sRmAcA3tRZdVbNHjkjRYw2M8tgoX0Mf
         UYbMqO8atGgvfbg25b7OBGRJhDGkoFNanjWuoUM5zLx35n2ZU1Sha0DKaIWHVncQp2P0
         Wzy2SwKFCEnHHIRHS3EzhcLmsWB+rkgHjoxMwxC2gPeyY69wD45sRSPaBWFe7FTvMrFU
         orRXAap+zVJCR67yasNCmCV6MCfhWxFAAJkqqzOu9kbs3J8N6n6PdzbiBgNU6nxapJOZ
         9D7IsmG+ZkdQ924QHwjr677HN15oJM2XtaUbMb1Odb1OOeGcBl87KLbu5jct+DdVmD9g
         3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772150846; x=1772755646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bVor6LYXfxmtccDaQIOzpfZaxn9rQCZgEET9kVlVfg=;
        b=TicyKobgPFDWpZTuRPLpgSzpgCNNdWc3b66RvEwnDJvemDgqBo+ee/1uLpA7fNk+EB
         1w2nvoaBPSC0hEmY7DGBZBOpdXwFydx+PF7RtRWeZgnITXVcl4I8ZO5WMMy+84J0YFW5
         zQq1cageTOwYLMobUcdDnDRpUnisqw00SZaCfy99C5AwMGbTm5dERGb44qfv1nkPUWqW
         MQk7V1/PD5IYU72Vd93vE3ALJwT/xGAwiN9gYRxKIX4DGLljDiJM9CLPSB1/gvElb3JK
         r59pWz0JfHBtO+y0vHTV6iCnsI/BODydN0V6athewfpfm6X+E26ckxKG0uEh50lbru5d
         rKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx9e3Hh/BGx4hle8JZDIc4H0uCRhbMp4sAkSVYFiRzZ7OfzW5Pr7PxyrGj3YfE8n3XfaMBimroGoyP0wNu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55WcKuN1xXDDRYVS1NCBv6nyLZpAIJfms4H4QNxPN1zjoL+NT
	UMuyHjF4TpzRhJoGQAxbJxHc6frCTjr14axu9nNbkpSUOcoYoos51aoO5UOiKON6+nLFcRQWBRB
	o8X1vtvl3e9y3e5pttm2KXL02kjAtPtp14wBfIjVOTvuXxNDZz/j9vvzz7kjN1cGwNn3Q
X-Gm-Gg: ATEYQzwO8B+Ic06kBzih5n0Dz7axrBAaSXLBpYeIoZFSj4D1oushqIE4ek2S7pKi7WC
	nU27ncsKZte3o3Pc/wrdd4fu5Lq6cRIlJAv6yS8JgmfC38km+W7ttjBfJl+Or07j/wk/HOS8YKw
	WFdVG7tj9cAuATUbaoqAhXicjOIgQTC8+SgQwxK8WpWzf/VfidDdORdcKk4W/HnPPzxd8q4WVMc
	4TND50Uo0goON63rztVHCmo5pFlBu4BlZqpBP8GMJwC7y9usiip/vxrRMRwF/Y3r/aFv84+kkZj
	7piwYPwQj6fMdFugS5xkiKkx9lL3JuuorXE28f8SCm/3FXgYvMjErwQ0aeU/XHVyFpTI1sOKNz2
	h0dZVlkWNnFLCMOCLLKeGF5Y3i3a1SZzmMja/ndLdrBrxvqYWPpfuyP3ARyHt8QMbRqOk+aqWH9
	whtt2Za2MfYNfXY4m3Wu6SHOBG28O4gQiMDTs=
X-Received: by 2002:a05:620a:2846:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8cbc8d834e4mr114775485a.6.1772150845885;
        Thu, 26 Feb 2026 16:07:25 -0800 (PST)
X-Received: by 2002:a05:620a:2846:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8cbc8d834e4mr114772485a.6.1772150845384;
        Thu, 26 Feb 2026 16:07:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016de6sm10754071fa.38.2026.02.26.16.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:07:23 -0800 (PST)
Date: Fri, 27 Feb 2026 02:07:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 08/13] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <zoyg5vpedt73nwqgihbovykybfvimvfgefa7zllponjlx45js7@hdmahvx26y4u>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
X-Proofpoint-ORIG-GUID: lQnUeA5a-pHdNTRoOoF6r779PzqVrjcj
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0e03f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: lQnUeA5a-pHdNTRoOoF6r779PzqVrjcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIyMSBTYWx0ZWRfXzT86mJqcfjaq
 Tgmzx51erf3eUZ8WJbzL4LV7GaPxL5CldusqIal4sRJfHS/K4i2YEqWaxjUViPTIsKtTN8LsXPL
 veYxMZq4VbDT+Uc9Fs2t6X/3751L/wHP+cM+FjH60cZgQkPlguSaGHoTwFD4saS6xD+TIMxhQf/
 3gDQxBwd4yjP7B1yRrLKz7lp8KXh5vuguDfzTrSleL6exHcqmJu8Z5fx8XJ4gImOLPBE4iENnKq
 ZCSe2WS15bSBl3PdynWGZ98qWLo4SRpSIAMDfzghmBb6tXpYo7H/l0cS8c1Dhll3831bVbPdnx/
 UQiDEuoCFdSZ3rksqdyHShZNxXMePajtL8e0UOMt4TEkTynjL4j5hU6Ct3OK4/sZbwRBkvEzKMH
 A2UW5AVCNq2vSDudus2PdzoLRSAZWeDxs0LFH8vBQhomQs6botOs9R3TtjBNRXuPtPGoZ7boiqg
 tSlAE2tq4eh9/OUDMNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260221
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94354-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: E4C2A1B1221
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:16:52PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-rpm.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

