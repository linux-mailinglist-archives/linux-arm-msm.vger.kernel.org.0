Return-Path: <linux-arm-msm+bounces-100197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL/ABaQqxmnQGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 07:58:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 641063401D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 07:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D2730B6A11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF8733EB01;
	Fri, 27 Mar 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S77P7EaD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFPpNHVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717873290B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774594305; cv=none; b=cb3+IkQSCPWJvDA1zG0LvvAjNvnG21nulCZsvEpSGZhtwQGvxZLhnW2y82yQ+KBrIfUbNEGIuOc5hd5Eju/GRixueiIDvQ5CFa7mw6SM7lkObGB1jMcnyC8WVrwEYNaltyyV+8q3tJzQC2olKi3LDkmbChWnMO1aXlig0wk2dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774594305; c=relaxed/simple;
	bh=OS7yLQyUaObsM2aHvRt/ope03bw3F9NevPqDTMN3HAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL20GN3ejK6IO0tNgcjPSV9nJDgENhNJCxhVzdHVz5WJGetNS55l9DDo95Ublma6Us62uX63NKmyTJqGkrbduIQBQSaTpFcXHLjn2nC6fnlJ9i3c/d33I/UGpwbXlAO52j+nuqKYL2CqmyqDkYouCebhDWgQis7t7s6qSa/3Itc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S77P7EaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFPpNHVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R29OHH638859
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=; b=S77P7EaDKjTPo+9/
	BgPKDJ3SybOe58RyGDjWzeI7gbRY5cwTd0jOoYfu68g9Qn5UZLerqhWlvGUWTsOx
	tS80vzik7llNxGKUkmw+vYruYgQVAVBSqxuKXXWaq3x+9syJ7j8M9dUYwj+gHkXW
	Z627XCUvnxGZKSWjDcLemU6GaQGQ0WexZVH3KjMn1lbPyRokswQYMPEDXu6UpkIX
	u8MOFU24QX/2O7hMEJZSns9EC6VnzBYTm0mRTVPYKJh+nUf0oIfNi4LxpwSXFu6O
	zXFy6BAWcdpmTokPASnEnV6mq/t8cNYiHDEincU//eolvRH2XwuM3D/bD62MFNzQ
	znqnvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883jqet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:51:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0be75dfd4so25057035ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774594295; x=1775199095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=;
        b=gFPpNHVcZpIcphEo0kZ3Q4+wq4cYKUcCGu8qeaLwQr1+ftsZd5yhuS8rf6juL5VvqY
         ZlbKGG9ypyBoHHOkByvg50U/qdUgsCFGHLdHrR78DtuVbx0Y6doiNwSzs0+cc3/pNaHL
         a+/6Os8v37L3WEmWnudAAwMQe3iaaRYXWepAGj+gzgyBTCjf3HuK/VHkWDLJb8FNqi8Q
         F5AjYSrpJtwhBS6S0F6kG+gMQxuBuK71+jWT+uVf2Fo2HCQenF9/jO+LJFxBR6vh6eGI
         0Q85b38Hcj6qbH1O1fhi1/dDETDG+VfPxMy7htM1m1c22Y8KU/0wMCrDF9GR4nLOrD0Z
         JTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774594295; x=1775199095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=;
        b=c+cy283IVeCPnUFpAWckMVGKhoioR8cMIIKyfKO2+eshQn93491vA4LyDY31V6CcAI
         qQCo1iq5Dgfai8F2ElaNiHT80HkB5VZ476fCvRjM8tNmg3+49mRrwcZSkUxJLH4LFN33
         9tBAFnwmHrkJJxe7jmeIAo3OLSOFcK7f8ytdJLZYWZcnbA9H+BXLDNv4FaE1Rqt01/8Z
         oi8w6jKkuIKsvV/67LGHAwmtatZoiANqocCOQy+LsgDgK6iASCsJEYIMcxGrnNzsrCCg
         9fbBFhvCaBg8jdzyA/iHGS62LN12h+jXkbZXVLclGjzUZYic+EwUvqEgIzmiUAn90hBr
         PHxA==
X-Forwarded-Encrypted: i=1; AJvYcCVNqpY6QYcGYfEquYp+5J6qUChs2HrGH4obhtZjgH1TsIxGGmYFv8UJw7hWTsolWNMC59aCzvcgsCSoRh/z@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkpH+ShK7a50pepemAble8ptdyPfgn495+rbpLG728AtVRrDy
	q5+R42vN5gE1AX6DN9gB58grAjkXXW8NeraTPjVQXRnj+L/FPYs7kkr1OFJ8upmfa/vwPZT8Otb
	s+XBIsroOufJpNuq5yxSoSjoPxlT/0HrX+gGObM4a2E8akt51sTeJuFnaNW522vVI1f9d
X-Gm-Gg: ATEYQzxwxyiEL9TpY2/1zkqUBFEZ2vVTZdPP5VgZl3GRdz6PVlxuYP5CrkvV1dbhTml
	wmjOmzJs9l4uZY+8iUXrAk/RodlrhjDYCgWACvlO4CcYs3L/RtE8i+CireFU9Vp6chudMIFTmpF
	kRzPjcvtQRva25gYhTouP8zxB76t0G1anZlmySnODfNL+zNoayfHX04Raj+emd8gfaT9bcsuRfw
	ZyX5mihgkaepCCDvYZmRi/k3miE8vvpCtTc5tSUOS3XhwasTcv5lgDZRJSWmYJx/bTOkujyjcxv
	hUfYgKrryVIqfhk1BjqqNWtCaew25av+iHraCN/4FMff/GOp/0K4CDCjVoajwtrbmejFu310W+B
	2tXZprSCnmiPkT9x/J1RPflUFBsPh1Qv6q+NxG+DerT12l9YWd6eVgAyOHlDnHw==
X-Received: by 2002:a17:903:1a84:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2b0cddb3806mr16899495ad.49.1774594295388;
        Thu, 26 Mar 2026 23:51:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2b0cddb3806mr16899255ad.49.1774594294904;
        Thu, 26 Mar 2026 23:51:34 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm59996965ad.26.2026.03.26.23.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 23:51:34 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:21:28 +0530
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable mdss1 display Port
Message-ID: <acYo8CfMRReJcbW/@hu-botlagun-hyd.qualcomm.com>
References: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
 <98730ff5-05b7-4275-be1d-1f9506adeac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98730ff5-05b7-4275-be1d-1f9506adeac7@oss.qualcomm.com>
X-Proofpoint-GUID: LKFjt5KsU4hCAkuBhwB-8SCvkW05ccZO
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c628f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UdrTMyFB5_aLOS8OFh0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LKFjt5KsU4hCAkuBhwB-8SCvkW05ccZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA0OSBTYWx0ZWRfX2Yycw9GPwC20
 gaQBKeSUNkUHxDxN3O3AzVGiTYBrl6SamGIsiHiMODPqtE1uLouGMBgJK7WXO9ycKNjLQtWQuWu
 UiJRDW122Qt1MxEZpgWSZ/FOmINPwFSyBoILZHCggQFf+ugEegYhDSFUJPK1NGvPRAxO9Pu5mFk
 FGRxCkM+YE1YJhxTlZ9xoEamZaMPwB/et2coG0eiRs2bgUqpL4OCZ6MrzC/sZ7zLlNiRiaS/SKl
 3mlxjYRebV7o/OQ5bAZ8HweiYkKfUVetKS9pUBxrq3GuITPLDPvJ2kKQC7HV/cPSzRTbXMQyoY7
 lVxnnvJsjDqwQawC6/9LCc8hOO6MiyuDPKjwtl02zQI2T2FEZ0qRuA+TP3K/imDXdjxGAzXjDPr
 EBMQO1G1ko7lCGI9OIqERQhK1HP7yUEBKZyV0hvIAztgV/2kB7DKdbZJ9M44Gx3B0zeQBz9nFjn
 9LtD9IZx2ZzSgVh/nmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-botlagun-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100197-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkata.botlagunta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 641063401D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 19, 2026 at 02:41:27PM +0100, Konrad Dybcio wrote:
> On 2/19/26 2:36 PM, Gopi Botlagunta wrote:
> > This change enables DP controllers, DPTX0 and DPTX1 alongside
> > their corresponding PHYs of mdss1 which corresponds to edp2
> > and edp3.
> > 
> > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&mdss1_dp0 {
> > +	pinctrl-0 = <&dp2_hot_plug_det>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&mdss1_dp1 {
> > +	pinctrl-0 = <&dp3_hot_plug_det>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> 
> Nit: a \n before 'status' is customary and it's present in all other
> nodes in this file
> 
> [...]
>

I’ll fix the formatting in the next revision.

> > ---
> > base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
> > change-id: 20260219-enable-edp2-3-lemans-evk-mezzanine-1bef9932ee6d
> > prerequisite-message-id: 20260203193848.123307-2-umang.chheda@oss.qualcomm.com
> > prerequisite-patch-id: baf07fce333b86c35c3d4cefbba5800a519952a3
> > prerequisite-message-id: 20260217071420.2240380-1-mkuntuma@qti.qualcomm.com
> > prerequisite-patch-id: 74a76fd6a1129cdbbd32d91d2a119d693dba78a7
> > prerequisite-patch-id: f4a858f7e707c8e330daf2ea1f4da58b4da00f05
> 
> This is really long and scattered across multiple people, effectively
> making it a chaos for tracking. Could you please coordinate with Mani
> who submitted the changes for the SoC as well as the ride board to
> send these patches together?
> 
> Konrad

Sure, I’ve coordinated with Mani. This will be addressed in the next
revision of the dependent patch series: https://lore.kernel.org/all/20260226111322.250176-1-quic_mkuntuma@quicinc.com/


