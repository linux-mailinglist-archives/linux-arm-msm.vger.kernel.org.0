Return-Path: <linux-arm-msm+bounces-114844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tLU0CgkJQmqKzAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:56:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3721D6D61B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:56:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8SIJCGA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZA31fLI9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B17F3002B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED903932D3;
	Mon, 29 Jun 2026 05:56:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B338E5C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712579; cv=none; b=e15aG9GrxQtNQHOxBqzS3fZHDyq3+ZhGlnNX34v9Do9oEpVTRlpE9EvWaOieX55z1prwlbdyohgd/911t4O1WAVWWrXKR1ZFNTcyJTXMPHMwFbAHpGQLzR8gB3+JAbuiRbAYrfBLtFPxaz3VVVxqB+O78JzDtRB7hdxhF0AzOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712579; c=relaxed/simple;
	bh=WYl64rUM3ad6FVdrebY8fHAtmJcINlmvNwd7TTqmiO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/XPJESQcuemRnYw39WZeP8Iq6Qwpki484pQswbD5nzMNKZgeAgvTsR1BJy29bZx1rOFyPyqeroidwHAa/dbThLQVsVz5KMgK0uUecpuqgznYlc+cC14bPyew+XqqIYbANy7NGD+Ey374Da8imvLENK8eQhM7r7uhYHn8KsNTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8SIJCGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA31fLI9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NCol1771884
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=; b=V8SIJCGAG8gjQeVs
	2wrcXgTGGOVNrLSI41ZybKQkq5KsUqwpoXzW8lQcj38eTmEiKLWo2U06HsYZTDRW
	USK2SyxOwAWLfXsX2b4LYtR/QBa/FqDvHiZU17+xbixG7NBNHuj3PVhh8xejVeNI
	4hqfkGzEGdzFVjFW94ihKRYBTKqc+zxcQKBk7TbZeQJOhK9cpPdXR30Xv5saQXv0
	SOAEM+5Mp9dl6HkDU7/02cSP1h0kM86dGDAg6zWv6MdQyuRuHtrBeqDu1ke5Pq+Y
	FmNVTMv8tz68yB3d3hpb+bg19TVqCSrS/oHgtSZ0TqPGaGe/LZSmWY1iAqEF1zHc
	umkehQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084r6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:56:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so6928669eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782712577; x=1783317377; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=;
        b=ZA31fLI9XRn4QCgOCGzla3EVpGHznaHzMZYAxTRBFzXDcqVl+VpUMk4qFr4RHxwZUz
         NM+0wtwJbz9nUkTHJdXomEv6Ukw1sscsybh4ixzMvFFzGhZsDJZmZ8PDXi0spJfQ5tlh
         +zlV2g55qKlgtlPwsllHNCQgQUCWXLTSIKZOeSjSVFNetdjqKrEE75fH2B+p00bjrM98
         lq06eyEGoN2Us4I9PdHvK4RRTvptDYLBzhSzmfUxHZlkAG4BTa1hqPRrh/SzdglgtN7d
         4ZavrYvzigFeoG/Pr2KJObSQmKkY64PwPMmHQvui0Ma8Jmd1dTQxe/3nMmOwilhTHtMM
         TMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712577; x=1783317377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObRr7+TQxnh3EoKEOea2q5sk6vcr6Ss67rNgubqe308=;
        b=j78ZnaFnJy9FAgV25fCl5JHrIajYlM9Ey4yrD1Z4MiZGAmKqEjarcQIlrrjrRIt0Kf
         zs4n+NcIhj71zfDtSUP0+HqJt94KGRVCcxzV8Ycxhr11HHfDppG0Jh6MZ9E+jp1Dhpte
         Bn2T3KwA0iAOck56n0reQf9hXXlF5hRea3Hs+1pBg2pD2QEeekqPpiGqEc1EcafPgLiV
         Tq4BkUvGJ8hQ3bYmpXMpXt4ZWgT2uU+qtjXiYYLE1Bxyu6yYaCOBoCbnPL4InyKDpqZm
         gYd9xCuvDAcoxv25f5dg/nphbq+nkkSD4YP/5dOY0nfoZtVZlhZKsskwtja4Kbn2c+iD
         NNtw==
X-Forwarded-Encrypted: i=1; AHgh+RrsrRWW7p5ZhbrM+aS5kFwNjcsD76e9RuVQ9hZr75Jzhs016VvhQSwamZtVwV10faKrEClHQEqON8I/7NpO@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGqPz0UfYw5MvaLM9wptot4nkmJcMi1Ej56c4oy4xQX92gAsp
	fFCYpXgVUwLWwMTj24mz7VtvZM91LH1GzpHzYyB5m3CZkTmGVW/28cOnB+QWzbvs9nVcPLd7lea
	bLMdURbte0+/rVpLnk9gS6b2QFdJbT7jRfjbIi+jL/F6ZTz96I2phW+Levhg2KuZW4B11
X-Gm-Gg: AfdE7cnR4gRLt0cGRvM+5hFMls9Pyi8OJeNi7RPAirh974N6NYtKD0Zpi78Y8MJCFHn
	IsEK+6SR2V5WpdhvhDWIp1NrIsqPxMA5EpDjsCgddMmRTbWHhhRuAUvUOlJLgaaK1Cni9Y3WKlA
	dIW0Qvtc+C3yPbFs/C7yTW/gIZP2/xW/8wHHWGYVWvj7xFjU9iIjOzaXzuAlHlfO5jRIbgKdMhb
	caUgQ4g7uVGC62SCMgNpyZLNrRYucrO7kApvBHZuv6U9UH0GEVLRLtAE30I7Qx1tulXBiQlNUgJ
	mwRHfLbtoz5K2mfznhzO77Ph4kBfyArkrFHeYOEjH5wWwji5fVKjhMD/s5rFW2w7Ob+MK/j7LVp
	eNIBG1zOq2Kc+D1Y1YalA4h1EbdcR8DWvVRa7KjyMoq6STKIvNvn8FN4wLw==
X-Received: by 2002:a05:7300:caa:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30cab4d3fe1mr8008548eec.37.1782712576809;
        Sun, 28 Jun 2026 22:56:16 -0700 (PDT)
X-Received: by 2002:a05:7300:caa:b0:30c:ab4d:382e with SMTP id 5a478bee46e88-30cab4d3fe1mr8008519eec.37.1782712576246;
        Sun, 28 Jun 2026 22:56:16 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9d39e7besm34579579eec.26.2026.06.28.22.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 22:56:15 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:56:13 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <akII/X8OWO5XN9Gw@hu-qianyu-lv.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
 <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a420901 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w56qM-ApfueYzBeFdjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NyBTYWx0ZWRfX8qTjNCSKM3OA
 j7WpH9UZ2lLPgstL4GGU0B7riK3EfT98v0+/bICDuOVnoC15VdkXB4DSydcAmxD7sDrnd8jYP3q
 olkUz55iCe2Cu6cRphwwvB+18QZ3TghOz7sggr1badn++jMf5bWexYjLph3HOBP3IHGWfEeHqMk
 JGo/D9rnGDj/YUQls48p/vx3w7pk7p9mIRIrcxNwAYgGgeIh1f6MiJn440brXo/C3AcUfGmWiQ8
 dPIF3ongzKyFtdoWYYYzJJlQeTV+ketIjYe8HVf+/f3elsKlDlDH4e1U2XM6Dv50bJRhKe+8wvT
 1TvL9Kf52bUTPcdpPBH0oIPirtMrbnB+9E6ZCh8roadT/Ri8l/TXTcp0MI2b9vhd16qx4hM0Lxj
 /ZIRi9n/sOWq9WbApTipjF5RKFnXIeoy4eRE6kiiNrYLSI4lzxpcUnEge8kWRtwS2RgrDwkVA0q
 W35zP3skC2hSzTpSacg==
X-Proofpoint-ORIG-GUID: 7hNdBhT5ArZIDwX-EoWLBxEHKZ-rF857
X-Proofpoint-GUID: 7hNdBhT5ArZIDwX-EoWLBxEHKZ-rF857
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NyBTYWx0ZWRfX6yW+c9nEuhJu
 uN2lhJNmyOyKErzWFoQIX2c2HYJIssmmnpu6eD2Wv299+iJTW4VsZiJ2l9qeSP3t0fVeBbm/Zcr
 1x7BqsG/tYP/z0JlyyCnRoCM/+a5fls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3721D6D61B3

On Tue, Jun 16, 2026 at 04:05:43PM +0200, Konrad Dybcio wrote:
> On 5/29/26 9:02 AM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
> >> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
> >>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> >>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> >>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> >>>>> under a single DT node, each requiring its own pipe clock registration and
> >>>>> DT resource mapping. The current helpers are tightly coupled to a single
> >>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
> >>>>>
> >>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
> >>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> >>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> >>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
> >>>>> with pipe clock names parameterised per instance.
> >>>>>
> >>>>> This is a preparatory step before adding multi-PHY support. No functional
> >>>>> change for existing platforms.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> >>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
> >>>>
> >>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> >>>> end up having too many single-platform, single-device specifics which
> >>>> don't apply to other platforms.
> >>>>
> >>>
> >>> I don't think that's really needed. This shared PHY concept is going to be
> >>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
> >>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
> >>> driver and may only end up keeping very minimal code in
> >>> 'phy-qcom-qmp-pcie-glymur'.
> >>
> >> Then splitting makes even more sense. Let's not clutter the existing
> >> driver with too many conditions and options.
> >>
> >>>
> >>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
> >>> move the SoC specific 'cfg' structs into a separate file as that's what
> >>> occupying majority of the space.
> >>
> >> No, it's really the 'shared' part.
> >>
> > 
> > To confirm, are you okay with some code duplication between the new
> > Glymur-specific driver and phy-qcom-qmp-pcie driver.
> 
> That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 
>
I've already prototyped a separate Glymur driver, and it turned out better
than expected — there's actually not much duplication. The parts that do
overlap aren't fully identical either; they tend to diverge once the
Glymur-specific handling is factored in.

Currently, I meet an issue when tesing the patch, and will post it after
fixing the issue.

- Qiang Yu

