Return-Path: <linux-arm-msm+bounces-114258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HDsdCjjJOmq1GwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:58:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E616B94D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 19:58:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hfId1Zr+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gz1d8FVM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 898C6300CFE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB083911CD;
	Tue, 23 Jun 2026 17:58:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AD52DF3D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237494; cv=none; b=eKfePgWI4CtGG87aN+SckxlhgJ6Hw/6DeZzY6TGtfJJux10pGAWBoG68jVT3jIZpHC8BA19Qq0A7QRAndGnb1TUnxy+2TSse+1LUNq2DuVziOZ6C69tKGGafr4RmYwlvblOt5mAkC7w09qyrLUZr1ULAYdMrScr0ft5p0efy2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237494; c=relaxed/simple;
	bh=WvxBejKx3XnfT8ZIK2R39VomPVUil3oBoPn/ofmMZsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFQFaSTsl9VkX1wOAx2iD/tFrK4sBsNHfrqlw9x/QSGIur3LKMjySKFEFfS+BaW/tOcigwJk6Hd0k7WH1zU44AckSkYDAVWiFy8L8R6ZixIfvATHKTNtqso21LY8cYQwEA6OaYGUT6vxGlGeAHyDwIHC/SMtMs+9cxB8/67V79A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfId1Zr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gz1d8FVM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NHpFK73753513
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xwxz0y1QgynK3CxOjDot+ZHz
	k3QiRVKHLygIBMPihZs=; b=hfId1Zr+i3JPaXe/aJ0YPJOtm7vlt9YmQIkEEPAC
	scwENPBBd3QdWYCM4L7+urNIETyFCmtPUiP+a+kAbiuD4VK7lHYjvZBaR40xPMlm
	7UyWhl7b7cNzOnbZHCW2Tc0l9UdBkYvQJuLrx04Q4m2EIyU1gIbVGnEx3dOfY8fq
	4SXTlYl4qS4Y2RqK5RMBHAYnUWo1DcLRJK8v86aU+vet289GnoPQDe5GNCrXFXXv
	tWQvwlpbh1H+v8vanwWYd+CT4WYBC0QoWdCqOjqJjrCc/ugGzAt6Pq1ol0se+FGi
	J5hnmmShN/cw6iYf0mnIrbwVfHDqoQgA/3QJSNFiCnNtzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29jqyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 17:58:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso7302685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237491; x=1782842291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwxz0y1QgynK3CxOjDot+ZHzk3QiRVKHLygIBMPihZs=;
        b=Gz1d8FVMjorPAQq2AXXfCCTIJFWewuFHZM4aHQfgdP86x3/M4BGNWI5n4ppIFJ8wH6
         9YhqJG4SH+bU834tW7/bU9Px6ygaIBPzzbVWn/JlqIzOR1YenB723nkPaZZ+MFL0nFw/
         G1SUaoUdqcW2McYI8vnqEBF8pZoCFHfbsiuwoZgzH+jTRM8+4XjGhvP6Ta6KrYAOJNj0
         4CrAEi/qqbTo0V8gViae96fzWwGU0PYqChJIM2FLydK0dMhDN7Ku0cGj8a3E3A7kTk/T
         jsXiwUBH5Sf8tFk6LabBXAmy2oUgNAQx1zvsuaely2j36WJwRnbaM0Xj3i6mpBWT58Un
         tg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237491; x=1782842291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xwxz0y1QgynK3CxOjDot+ZHzk3QiRVKHLygIBMPihZs=;
        b=KPsaTCFfT2gFV3qGJ0cJAicqBLB5ZzWV9oLEmrSmLY9EIV4A9lN3k10/2Tto6XueF1
         lnZoAWuObqMCYRAWZEo6WPT/W3CPapQcf2Lf9vxt6UmrOEs6FUgVDQxJ3AbN+eLQbvZW
         eDjpE+LXBIVu+iEjqg3geMwDpVh7CuTk/oVD69DnJ6JymWOWf4KUThBp0v9E1L6eauST
         2YtTnAG3/kCGWqsr3TjkZHeKrUmqtVujhFdYGczYoBvduQCDaA+aV/iYiaT6RCPTDn9u
         uVrwRp5q0QfK/JTqH/yoEVsgsBRFe1SwFtRSQHXFZ9kcPFPYBgiBKw5jc6eR+Tcr0KIb
         /FGA==
X-Forwarded-Encrypted: i=1; AFNElJ9q6P+P9jdBDXTGY6j5E7RKwQJeBbwwTXWcgd/XV4CFvHptD5G/HFxcuwKdUAkY2EY/2HwzLXXpSksd9AFb@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSQ0UG9e37m8blf6RKPZzh5Q4IUDfLeSLTem6xXLTTsrewB5R
	jEj/VQ5NzcjjeJUnGRm9ZlLXp2dzJNvXwF8zb1TFl+yCf2uL5+cTd/Lp6r5a8YinHWD3Ap4uF8L
	f8+6c0q0UyKqEZXbG/n4LsJo+miQwr71Q1/T3TmlmD2/Ss0ZeuYWhuGqXyPEzef7GWCmB
X-Gm-Gg: AfdE7cmh+g4Be75nY1rn6qNN7KfwcJ3MHNYuTru2IivfKikkMgvy3WmLGB/mre2/4zy
	YWtxPyv5KROM8AqhUvR1r4gByvC0LKeuYcwvYllQ6R2VsA0SNt8ouUaEeaNnucQGz5PYXe3yH7R
	KqBR9TRdrvsHcn7T40pu6auUgeCpVv6GDkqDhywn6FrHiv7N9qIZIBy5bAZ7njE1QjSsTUqzhVs
	cURS1Vg4wSkqZrV+SPFiOuhCsTLOw7rMesqtaJs9qKwn/EPOAHuPMAWMDhXATsmKeBYA5wB8M9N
	EWqc/UFb++F6asoB5BRJGm2lnJFpLp8lrgIjrJq/wtfwlOJg3aQwmwK9FYdTKIuLGQKN1tfBvj9
	cnk2wxQYWJPg8iiFg6nZbg/jQQ5DdnDSmjLTY4Q5hogn3zPyAl2C5b0I4kYft7dWWlMMZcGzhJ3
	AeI1UT/MXPFRhwgjr5VZAN+55H
X-Received: by 2002:a05:620a:1b95:b0:915:8988:4e55 with SMTP id af79cd13be357-92783f2c83fmr10718885a.40.1782237490984;
        Tue, 23 Jun 2026 10:58:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:915:8988:4e55 with SMTP id af79cd13be357-92783f2c83fmr10711085a.40.1782237490337;
        Tue, 23 Jun 2026 10:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f08sm992714e87.66.2026.06.23.10.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:58:09 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <r6eyzzflushayh35wjqn4ubuxffnac6asf2knfh2erocaefmhp@mchrnzhjxjni>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3ac934 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=q7KAvXTRkkGcKGliRn4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1fkla2BgGyPcN5oEbWJ1RHt28gZcyaSj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfXxw5QHtwZKRHg
 yRgPXsmcAwiHRKZUezeWzFvg0n8E6qsN5XdGYpPAzFJTddEh7Yri6IO15LveWUB/gLKW2YCQiKP
 8EVkZeAGRzJzPGX7SlpNipaDMy/VPdQ=
X-Proofpoint-ORIG-GUID: 1fkla2BgGyPcN5oEbWJ1RHt28gZcyaSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX4ll2+40H0lY8
 gI830XSksPAUcqPDBPstWGEetTpe64a3912cDHxbFUxA/fgUFevAJ9G08Nqj2zYiRB/q1ARTrGF
 nyft5TCrrb+PylyTglvy1NcnWu2qVTyVXHJKEgjAFcGUf9DyCDfXooGscgwzHWO/h8MK4anrfky
 V44700781xv/Ew86Z8VfSesVahc/uwl3DvXeP+U/Nbne+McSDmER5ifjAYqpXkAtWQD+8W16Ukh
 SAuVrK/PLyTMQ7Ad0Owp290gXeUpFDpwTNkdmxBZ+X2dwIG6MFZ+RSauIBKtWW2yyxwmMIQsmSo
 fYsWW+eJiun7V3l7oiHA9M2/PpSTA5V7BDBYRIvFYtZ4Y24ogSPsg0V9iIsplMRbSCZmlYOri0H
 tGbAJgIQE2xJAGvfEUcasPS49ugjMe4QXsb5YAgEmO55AJ27NOH1ndTte0A+TNL0YB6Nkbs8miy
 ZTyK6tTCxVYGJrwzSxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114258-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:usb4-upstream@oss.qualcomm.com,m:rthoorpu@qti.qualcomm.com,m:westeri@kernel.org,m:sven@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,mchrnzhjxjni:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90E616B94D9

On Mon, May 18, 2026 at 12:29:51PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 200 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 ++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 +++++
>  4 files changed, 256 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

