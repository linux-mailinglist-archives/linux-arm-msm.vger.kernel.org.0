Return-Path: <linux-arm-msm+bounces-92316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DxyOc3siWlpEQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:18:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147711025E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 391243018740
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC86A376483;
	Mon,  9 Feb 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYowUr+F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsNQDv8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBC62FA0C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646730; cv=none; b=kLDLIvwCpiMJCJgMpSAmED4RtBJEbL2/b9xmvb6XYLeTsobb+gCo7Wc3G3Y1jBYl5OF0Hw/gigrabIt5EmWoRU7HwSBYhLhdWETw1JbaPy28M+QwyHQD+K2FGDqP62o1/UV79x1WjZ5cvtTcLPTtjElV/5VPtPihyXNp34E0Ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646730; c=relaxed/simple;
	bh=5PXu3qySDBvswfINE3hJYBeBScKYNFGv0dsenYsG6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgjNQcQnu/8nj+3vD59NJ8SirBL6Z/m3MCr5eO2+W8q0N8MPr/o2K4v5+QAPqgJYiUyBaVR9W8lA6p/I7K2SP2Gx3stChaIEYaRHVD1v5oyLfuYEyAngHzXJP98r2r7i4khxddObsPyeBmQpdxX6aCpBuancjiEmRzISP5HntyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYowUr+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsNQDv8f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6199ZDcD1656181
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	na1O9bmAQ0y7rPxKPjqTjesU7wbLrTUYxNjnJERNCnU=; b=YYowUr+FIRHUcc3y
	IdPv+q1/rVReCJSE7SoKOPtakUfGah8bzZACae1z4cvtI+osfRAsC/6ZAYhjXV50
	9bBR4ZRxyihJPAIBKXInqJ9HLuzvJPVwoTg0k3FL8IgVKTR8Is60E/apGP1Uv7C9
	OyLKKBpH3vlMcw1wuelrRrnC/MJE+BuchfW0H38WKQ9CWgyLk7lnspt2mZLH8/NN
	NST1VjUw4D6xwmMffWpPyJ+LyS4Mtq9rzh9tCmG1F7PbR+omeUvkmAMKbpEBDtCz
	euDe4Ms+NBqgTitw6aS0i/j/3eWgGiSmvG18peH/pG94BtGfra19Kanqeo97FjRF
	s6rkWg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862t0jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:18:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f9d5b8bb57so3616320137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770646729; x=1771251529; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=na1O9bmAQ0y7rPxKPjqTjesU7wbLrTUYxNjnJERNCnU=;
        b=NsNQDv8fCHe27ilyCYNGtJOEoPixQgNclYeu9rRfL8w+qfvAd/hENgXTlQnb1eXoTF
         Z00BbONvwPE+N7yzV0N5qOIKmH7CVm4C2zmBV70vQ0Ww/5zqHx1oSc4jUDXY6dgPdcpT
         D62Dl+Ke7Z7Wgdma1W5eGnsw5xMJbiImjE9Hxfp4cJpbR2WhrCU898WQIBDNGcNcWKGM
         0nsGj/K0E7piq3FXYviDlhjAKovfwztdFB9d+fEo7oBAiD2A7DzRfItCc8VVueRjPT4u
         VicYg0Prf35STeU7AvN0objy9TVLRtY7esjnxs4hTKDVezHLgk2jektnXnTDLTv9eZrQ
         +gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646729; x=1771251529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=na1O9bmAQ0y7rPxKPjqTjesU7wbLrTUYxNjnJERNCnU=;
        b=Zs5vSanwPC1Ydwsmbromc+iviOn1iR4yDxvZR8+PNO6SZ3X+9PnTltfWhsGPhoi/ei
         GpiuAGhvbKBVIS9YbqX3qblOGAzW/8LHP39/AgMotcqUvDNGc2uDP6tqXDYQ0/o97AI6
         IcscZSW8bU0NMgpLeEHSVwXa4dPtK6BwsBUXOWLY4JqrD+f1SLZqe9Bsuaywh74cI/xD
         ddiCFymxwkpP1361fVfiqwJ5Bu0hEylI0ELjX6Cs0ckokcCaez3CSXeEaWrx+QjXtncw
         0vuyGkdhL9kEGf9gN1yyXOapfj8ZrSoWJ8L79HWxV+SisYwbB7Ms7CkUSKGGKmf9WAzm
         1e+w==
X-Forwarded-Encrypted: i=1; AJvYcCWFCxwh3xXDeD8GpOFalkjsBci9cO2R6z6OdnsF8kRQMfPBlusDEI6HSUptuMWjytlfRUsT7NDnW5skacgd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+uxXueg/yt7mt7bDFpwtUCxnliaQOqHV+PweFj1TJZDUtlrQD
	boItkUbzwbMMciAchGGPVrSXZrJzpxq8C4AdyJq0O1eeDPZ0NwhkDQXcFlUR+bVc7O4OwVkzfvZ
	21HZQ4LduiNu4UXHe5QfNyGK0E6McaAnd/O2+h2Zsmas1txRt304olkoXVQrOH8bET2Qr
X-Gm-Gg: AZuq6aLT7NJIxKKouKJdk4cpZkzK3cioebWn1uJdxUbNXhsSbP/JAo1kinnv6s34NrA
	szjZyiSekkVOETN6QcmVtPWDxX3Y+X8YixNwPj058SsqWO56cyhchgIUk76jj+YN8j/oWahdYLp
	M9mGcbQk66nJJ5MqLA2BDW0Hn2KWTuyaDCcYaOZ43xXHjUWq1zkGT+mcCc0tYwX1ZbisYOwjchs
	zkKLW35xkQhssd5BV3Tjg7pxBq01wwsH7Rhcnla72gpolu3ZgbfCWy0AHWW771Yca7uJSRoMQ+k
	/+i6qI74nv6sYXMQ9YnJw0KblIqn+WECoxm+Bu3nqzClAXlsihoOZ0W6FZ6u3QMgGWOGzO7a27j
	1rOjnLZCGP/d9vaEUvEe7ZrdiTGEPi4FgYIqky9EohvHPzTffAPtwP5gfMPoH1XQ0I6slAw4nMJ
	SQyB9lbHN0D25mgY/XxLloV90=
X-Received: by 2002:a05:6102:5110:b0:5f9:3a74:e17b with SMTP id ada2fe7eead31-5fae8a7c059mr2526822137.13.1770646728690;
        Mon, 09 Feb 2026 06:18:48 -0800 (PST)
X-Received: by 2002:a05:6102:5110:b0:5f9:3a74:e17b with SMTP id ada2fe7eead31-5fae8a7c059mr2526815137.13.1770646728244;
        Mon, 09 Feb 2026 06:18:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21951sm2653680e87.70.2026.02.09.06.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:18:47 -0800 (PST)
Date: Mon, 9 Feb 2026 16:18:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] soc: qcom: pd-mapper: Add support for SA8775P
Message-ID: <ilkhlru6hbaalwrc6r6m7vyuqhuv3asww4hhmjyqxyuyky3t3a@whtlo5pduecp>
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <x4muzue44tizvlrhtrmat6f2rdlqkzwuuo6l4553lgrewlsr4a@n24bqtl6jn6s>
 <a46bf66c-8f88-44c9-afe8-78dc91bd50e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a46bf66c-8f88-44c9-afe8-78dc91bd50e2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfXx4v/ql1yaqeT
 ySV0W6tg+awKpOv2bDzFJx7vWm5u1tR6SZzrEd16GBFZKm9JD36otyp2XZM++kcBs+oriE/rwdz
 UaCXxJxPIINM2CTMkCQWgkGWDoSej0OLzPmd7Aulk1qpwRcFmv/PwMaXb1KdECg++eHxDZhRPr+
 55/fVZZDR7dgyLxS5mzPV9HbrEj8X7nyAbLQFKN1gdXgH+CNCCbcs4MCxvyDTJaNoVQ2vVPgrmX
 FUy3Kpzn9PLHx5PBK2PYQyx7dXJujq21ifOGR8Ziuq0hrX2LHlTB8ObSengMDMQaPuZYkNrFsNF
 8tcZPR0nLmpTCTnEGE0KwG1hupn2BjLtCp6rPUpAHv3Y80tH0sSCO/sW7wCWYv2xztwzQ9YyOR6
 uL8Kn8xw+dyxUaLN71T4MrTFnutajgoVAuaF4bu5n8OZNcoCSQvUHUus1aTgyI+CGoLqisbyCsW
 tY1TRh5DUBujjEEgvog==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=6989ecc9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=WOszOR614bZczyQgnW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Mmsyc6Bt7WNka1wOvWVNpHZUmnmUt_Ye
X-Proofpoint-GUID: Mmsyc6Bt7WNka1wOvWVNpHZUmnmUt_Ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92316-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6147711025E
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 07:09:06PM +0530, Mohammad Rafi Shaik wrote:
> 
> 
> On 2/9/2026 6:10 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 09, 2026 at 04:59:46PM +0530, Mohammad Rafi Shaik wrote:
> > > Add support for the Qualcomm SA8775P SoC to the protection
> > > domain mapper. SA8775P share the same protection domain
> > > configuration as SC8280XP with an additional gpdsp domain,
> > > except for charger_pd.
> > > 
> > > Add an entry to the kernel, to avoid the need for userspace
> > > to provide this service.
> > > 
> > > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> > > index 1bcbe6968..8b899ec7f 100644
> > > --- a/drivers/soc/qcom/qcom_pd_mapper.c
> > > +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> > > @@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
> > >   	.services = { NULL },
> > >   };
> > > +static const struct qcom_pdm_domain_data gpdsp_root_pd = {
> > > +	.domain = "msm/gpdsp/root_pd",
> > > +	.instance_id = 192,
> > > +	.services = { NULL },
> > > +};
> > > +
> > > +static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
> > > +	.domain = "msm/gpdsp1/root_pd",
> > > +	.instance_id = 241,
> > > +	.services = { NULL },
> > > +};
> > > +
> > >   static const struct qcom_pdm_domain_data slpi_root_pd = {
> > >   	.domain = "msm/slpi/root_pd",
> > >   	.instance_id = 90,
> > > @@ -401,6 +413,15 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
> > >   	NULL,
> > >   };
> > > +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
> > > +	&adsp_audio_pd,
> > > +	&adsp_root_pd,
> > > +	&cdsp_root_pd,
> > 
> > Is there no separate PD for CDSP1? What is the difference between CDSP
> > and CDSP1?
> > 
> 
> Yes, there is no dedicated PD entry for CDSP1 in the linux‑firmware,
> 
> In the device tree, there is no functional change in CDSP, only the base
> address is different.

So, you can ask this question internally.

> 
> Thanks & Regards,
> Rafi.
> 
> > > +	&gpdsp_root_pd,
> > > +	&gpdsp1_root_pd,
> > > +	NULL,
> > > +};
> > > +
> > >   static const struct qcom_pdm_domain_data *sc7180_domains[] = {
> > >   	&adsp_audio_pd,
> > >   	&adsp_root_pd_pdr,
> > > @@ -572,6 +593,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
> > >   	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
> > >   	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
> > >   	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
> > > +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
> > >   	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
> > >   	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
> > >   	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

