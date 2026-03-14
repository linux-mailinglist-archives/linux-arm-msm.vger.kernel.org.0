Return-Path: <linux-arm-msm+bounces-97690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCYaJjwntWkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:15:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A230128C4DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0063A300D54D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77D730F531;
	Sat, 14 Mar 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aW4Goiiz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sg3yYVix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC41D5CC6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479715; cv=none; b=otQIZkGTSvj0DK6tVCZQH25POQb9W+N65kkPPEo0eFwPl0GegUwhzu0yx8r6G+x517juP5kISTM5gtv5EtNSjr4y1SpB0ashsSiUFvFY16yVLjolcSZmc5wRNH5WF0jPyiHeT645lER7kpmeBq598bu9J/DKKXnKwlNqY1DBwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479715; c=relaxed/simple;
	bh=MzAvj6UA0GUeQAH5iczc9XOz5rIXdUTk75LaxseSXgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwUk1NrRYNHTUNk/1KXuq4F+QOaeeUX8aAV6a+G0pPZQAf04fxuPWF/fOFYsbdAIgs0lttxSHELX+cRDan4S+Tb85sMKpS8tYGtRHrsem1NY72f9i1LrK9f0G/s6Y4jgUxa3zV0nm1gxFH1X9JxA63DXuuaeUX3/Ukpmel7ShNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aW4Goiiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg3yYVix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E5Qeva3729122
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6NfFeCZ44uAxGC6xkuX1LYR
	4KtzcqKNkL/S1CI0bos=; b=aW4Goiizs/5Xw0/2FldVoDebgIWrTRnc6eWl17QW
	n/SkpsapqYmgwleIrRKhyq4DSyxlcnw4Qy9V/IkUp2hhDq7+DrZ0gKGVGm7pBNgb
	CbvjPUdMJiNrrq10caZ0OgHuNUFLMYeSeOh7rbqlAR41H1As6ev5MXbtVBdqavHr
	mLNxrKdsslradvlpgesEuFI4MaoeQf7uwX2GLIB5D0+JHf+MRcpRcxkxFqkTYwS/
	8y8DhELRSwQs0exBl9OSCOxvvkYyaDj7QTa8q4m803ZEew6aTuhXzyDjb2v1OIFD
	iP0G5QWexd4fLympWIurfGjsfghAWauSF5/YuGDm5i8bEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc0fs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:15:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8b37d4b2so2216825185a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773479713; x=1774084513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6NfFeCZ44uAxGC6xkuX1LYR4KtzcqKNkL/S1CI0bos=;
        b=Sg3yYVixHPhsnRAArP0PW1kaFm2bl3DILDqY2sWFFYui0A9Y3HJey6GnuhBNWth+57
         Tzk1SyyOpcDG1W5oomsjTIsGz7WPe30846T/m7g6HW6aFaC9LVICYYxuBAix883XU3GJ
         36FoRsPENr0Z1XZVhWmqnuB+eaUXK/mK0s7KKMlbkD5fCzrGIvLWstG+W6gkKBjvvxy1
         +0JgryyhCkaWSlSt3POyiStWQb5julA6/jdXyn1kxvH4x/8aJ0KXfyCnM+EHTm/qezky
         ALw9GytqBfA35Q06rT+U6XAiedw5YjBqtEHX4HGwh4PFMkUK59U0fuEibMT7j6HTQGqC
         WrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479713; x=1774084513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6NfFeCZ44uAxGC6xkuX1LYR4KtzcqKNkL/S1CI0bos=;
        b=GJ2rdypvgIVB/OmbMss4uXH1QrWTPIMEVjYybSTFvFdVfH+xdXFGO3gLfyOpmoL+0I
         RH74ZSeYwPBW3Vg5+Ar26MUXpe2K0x+jiGPuYb3rwFNXYGnPKQoGWzpc4MTC0ofVLttk
         9yNw7Bn9G14qWqwhcyoetCVXBrb6maN6s7LFDXq8u5RyqpNXz1bwAqn5Ncc571q4kI+u
         ggT+1uOGqlTRkC+dq0e76KgngjklFc8JJS9gqE6Ez3/dZF9LZvkvxeMZ2X2uIUfn5IY6
         2yC02opxmzzW7MnFoaD4ewhX1yJZjlVMK4IjetRXjj/ImFkcV9qdUjgrxDQhcGy0z/GN
         izJg==
X-Forwarded-Encrypted: i=1; AJvYcCWF9+JSAlzcmYPE7KFPuvGwLhAJ5s1km5bJJKmdYuj85UJJxZChod8ZEkukliawdtsyO0j/z4AyycpSssQT@vger.kernel.org
X-Gm-Message-State: AOJu0YzogAipa+Wp0q0cUQOp+RCC/uFlkFGz00mqHw2pvJ6xSsOsSrb3
	3k3tNxNVKEecjBmtPlWfKyJ3fXCjxZflx3IxFAtpWEZIyEB8cTs3JdipdSKXsIgQpJsP3T8pLVe
	hTm1vE64KpZChf7Vyy/xKuUr3c7cKvhegZTr/jCgsy+WRWtlv1ldljSo1W/yWXoVq/ouClmp56b
	HK
X-Gm-Gg: ATEYQzwz4KoGrmEX+4hZlfucp3RFM7IPHEh5DY/6spRS19qWUT/NKxFnAmnCuXyNQiC
	WKVPe05vlmndoB0omwEZUs+vuWSf2iaV2sKLrVTyOQze4CL1JzzXXZL+x0HOsFWVQhW6Hz8gB5c
	YrxnnNVitkNnzkhmRP4nwp8MTyWcBmDRC/oPTuVJaMyfwDu/PH93K1uBFfR9I/nwilxl5lBp5DZ
	ylOzwfFYYnW+NPVNdAEY2V8YGjkIfzIQU3QlxvLk93XSWLMW11BY97YTKbzD0rdv/VkYot7xJbi
	xp9koGXvqzOVK1/mAPbc2OS6TW/n12wDDepzkQB62SKiWqbf0n2+g6R6er/9uZFhzKxylB++ruA
	hIhCESHTwxwUF9Led5Rt5VvnDctE0ny7FbplSVfcW3uCzIKyEmJOCoU5nL/x8YhdjJ1/ww0MLyy
	2q6YJDtVUdB7XfiSNFeOpHRe9cfGxLX4LsP1A=
X-Received: by 2002:a05:620a:44ce:b0:8cd:9322:d449 with SMTP id af79cd13be357-8cdb5b49050mr792106585a.56.1773479712953;
        Sat, 14 Mar 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8cd:9322:d449 with SMTP id af79cd13be357-8cdb5b49050mr792103385a.56.1773479712485;
        Sat, 14 Mar 2026 02:15:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636668dsm2055208e87.70.2026.03.14.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:15:09 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:15:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/6] phy: qcom-qmp: Drop unused register headers
Message-ID: <o23x6uvqw734jemgpr6oaemx4linzymy6rdqkreu7d6ktvtd6c@v7l3vnv5ttsv>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-6-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b52722 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=iRVC3UVk7Zq8eYTPAAMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zt9xCsV_oP753haUJgpr0ScY0nrq63T6
X-Proofpoint-ORIG-GUID: zt9xCsV_oP753haUJgpr0ScY0nrq63T6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA3MSBTYWx0ZWRfX1vC9TObBJOFc
 d3JN1ZJbgsURhSPisXtuKdf2CwuOUDVvWTlV8IEADnC7mI4PAxPEO/XNgVcUL+nY43WNZxVeSLC
 eol6fGJzueP/oxa9yPkbc/NGksTVUdb7QgSHNlfEYBCNh4tLnuJPDvr/znEbGIdF+zM0HHGh9dv
 9Jm9eN0xvIGijGQUj9QiEIuXm0HcPi2NWCVvqtoEtyMmtmExwGyNj+aBmS5kWoTg5X1F1CCmD08
 96WmCcvTwDL31Lu1QM/KePAr+bQxQYu4eg9pS919Jvinfwu6GWC3XId5z4jgTsx2ovvQtyli58t
 O1ENZ56jRJQ0wjSqNIZT882OLvxa8MjtVk7QngPIlJ3VdwKNDPwR41p/S2svOFQXoTYb8n8oF8P
 BNL2oYqJJZM27HTlUR0DMFCy/OxLGVNS/j5iGRSWhpMKh9Dq1r2HvePDmVAiypNMJNxnfjixURV
 OqgKySKix8IvKj+baLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140071
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97690-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A230128C4DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:24PM +0800, Shawn Guo wrote:
> None of qcom-qmp drivers uses header qserdes-com or qserdes-txrx-v2.
> Drop them.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   | 140 ------------------
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   |  68 ---------
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 -
>  3 files changed, 210 deletions(-)
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

