Return-Path: <linux-arm-msm+bounces-91736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G4TAniVgmkRWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 01:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B214E012D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 01:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27B5030BE90A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 00:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381BC219301;
	Wed,  4 Feb 2026 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4qbKGWS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAxAuNu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4120CCE4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 00:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165619; cv=none; b=IQps/MzxdoJf5Cf5mamelUf8dpKPSgAH5MYapT9bN1qgvO0q2ByYv6asSN37muYOEP043UyG6aTmWi4EJDvTo3R8aDXS02bXQZdOlYwufexFQ6jmSHg0mVYS9QPmkxs5nDw23W/Pc9Yohrp1NZ5xq1KHYmIGid5t4nolczkhoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165619; c=relaxed/simple;
	bh=F8G7Eg6ph2x/u9+FXMbeiayUy0HItPcu7w225JbCLP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StPYNn4N9M0CHZp7Bvk4YzfEMJ8FAGSUH7MNOIVAOeUxxeiEVomgQ8lCfXQ0p8bpcb0KRyZLHiKWOcPLXSgfuxc6V9loMCX9pjDFVU3yQeYATbDTwfMH6nCNRbGodeR9KyXrKqS3vrhXNcrzzjn0BdlP/Z5+ARdHkwNrNV++wcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4qbKGWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAxAuNu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlwBK2154643
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 00:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzfUjUVNXkWGUVQZQA9MMFUd
	7EVd3Dj+aLgbQeZkpK8=; b=D4qbKGWSuYk5wQFXWxhv9ULJOl5q0L9KOIQOJYlg
	XGH5YpjxsXoAVN7vjbrdkwNuxcV1uN7mrQLqnKtbxd7g/vlFF2UI/GYPdf6fQ0Lw
	yNfG3V/3m6VO/Xv7vSZa/cHB82UUXT4lj8VExjpPW8C3Mq3/bBSmueW8kaA4mHYd
	KodYnmyi1B1t/pg1mxU57vI6wbg8g2AtD8SeuWQ1BR/IN2lf1/qhEwneLZCPCnzg
	BhAi8yhU2jnsgygNDFfwUoq0WsJp+P8a/k1Kl2gXiX7280OFGttxmR6xK16bXvmv
	FLT/Vxth1Y4wxyUJUet5Jr8PtoLV8iSyJsQIJvnY/j4n4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutjvfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 00:40:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b315185aso1530660985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 16:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770165616; x=1770770416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzfUjUVNXkWGUVQZQA9MMFUd7EVd3Dj+aLgbQeZkpK8=;
        b=FAxAuNu1YJxqbCIif43GyBC7Ho/wh8wJv2ZJqLm5afbbwzgoYBi6GFhU6dJ+SPoqg1
         jkS7nU1Gg+qPncG97SnmqfGu+0d70BCIbuZSmWtpuzNutr3kzUCt/J0YO9DkXThlyn6E
         Sc4ZrJqwxCerEkKftyriunvEdb9l8i3xZFbENAe0IeUcbWVGYU7rp/8SxcKuQ+cPcVWT
         7o32dU+NAvs5aNSogo1+Rnus2gnzEBX4CyNMh3AIR+KeGaejCvew/sJZpckqJPZeuhqJ
         UNCRwvBNxtkHIzrhl7y0iY5ZKPgR9YQn/sVWq6a6XYgBOYx3C5paWbQWlYmKdfrjM41n
         m4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770165616; x=1770770416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzfUjUVNXkWGUVQZQA9MMFUd7EVd3Dj+aLgbQeZkpK8=;
        b=SSr7vwGKxYRVsSAgCrYOdvPTnd2XcmwK/AsZQ/FQKzH0J4S+bXzfy3xSgKqo0a67uR
         WsN73Xb8NCmrrA6fhdfLdgLJDO3kbc/FJzu0zRNIujl5JVYPBx6gwVGgl3xY7Y/JKkTA
         ydbSvegM+uPkuyoBcMtuWdEPu48seQvl7bbsHyQ8v6sTA52lXxSFvzQN8WBtHtWnXPxk
         zBPwn6EyRd656aUE5KQET6mbxkEpb/H2+Hh1D1e/Xzi9WGny8M1v64phUbAjgnBO/c7Y
         UWZuMgx390vLDfNJIYEZ0C+TsCfzu3NSqaFaGHogffTuaTvGYV02EHMMX1hpV1vnjder
         9KAA==
X-Forwarded-Encrypted: i=1; AJvYcCUd/PdXBbSzsnQklBFVqo9GEZs9CdNeBnii3kc2Zg3OsdeXA2Uwbzrc6IPxfZsep9SwY8Tlya23cihQ0Qp7@vger.kernel.org
X-Gm-Message-State: AOJu0YyNY6aY1AcJNjJ6QBvrMRtS1EihPleVNo6c7ULZSelwk7Y/NHGZ
	AgG5x0kEz3wmPGd14/TFfCKoRUtvEzN8Hf+VxvMNTR8CBVLZC+9hp93hI05634WprbQmC2oLEYB
	US5nzEh6iD7dC/OzNi9LRy6XmEQFJVqlTz0j+pjqQLThY9UgsT8mXUfPtbwgNSB3S8Jly
X-Gm-Gg: AZuq6aLTTvlIYKmPDjjNpPD8esswa+GBSRkdNVsKv65is8o8I1vOda5RUe1CtApJXrX
	227fgcN3/93Qs7lBRCtwzVRUZabXW/3931iFUiKpySYAaDphnzEUdA8OEpisrLpJyFf0/xXwlTo
	1uoTInA3/YcRCP/8h+bRGL2bA2laB+tOqtIlWj6nskMc2TwSWX7x9yr3+l+nKhn9TrfDkLiXBeS
	HLQpdxd6tYzfJj/HGGgFTeTPowZ6i5ZOO10XTWs8sciWRGCiRMI9OFb1ZIRyEx/ytUQBa51u/A0
	FyP9e7xTwM0DY24I89AfrtExgZCUpnBOJ9ghP2rcmR0SihdJh7PqYuyZFcYEwaZWr27Rxmvb0wf
	y4kytOrF1Dg8eMv2jBPwrOuudsnR9JL1JjuHAjXrniMgrsSdoIU9BlLrVPpRDmJi6bsBNvJcTml
	Aj7K8e8gVn6gyfAnsv/P6Xxyo=
X-Received: by 2002:a05:620a:7105:b0:8ca:123e:819a with SMTP id af79cd13be357-8ca2f84af5emr183837585a.36.1770165615888;
        Tue, 03 Feb 2026 16:40:15 -0800 (PST)
X-Received: by 2002:a05:620a:7105:b0:8ca:123e:819a with SMTP id af79cd13be357-8ca2f84af5emr183834085a.36.1770165615479;
        Tue, 03 Feb 2026 16:40:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e38822217sm245917e87.67.2026.02.03.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:40:13 -0800 (PST)
Date: Wed, 4 Feb 2026 02:40:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain
 handling on SM8250
Message-ID: <xouz47l4ss6n6jtag44xptv63buuiyq7hikbtormstjt3prdon@nfvyvlksee2m>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
 <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
 <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX9bEYuiveg80K
 e7ZMq6RCr63Ht/b7zRkpkrB0kB7Ikelh06W27CLZT+Lqhmw6pJI94ZHRf9WEnam18jR08vVWIf3
 2li/gr/eidx7WAoPSXoU6ek6geE/pM3ICCR8dgfQ6h+oRwxiHBPabkd2vW5Tbr4YhsWE7PNO5is
 PofcsQY4zsMSheF2PMv4hL/cD/kYGGxaA/evSTXN7npZsl9buutTzS8a4PFNY6x/msR7wheKDoJ
 Uiws5MiAtHaNH++phcbS9LThuCOMRh+AcYrgjfI5yGrg+PKAwZ3nWlK+D0/1UICi10bgw7+mkMR
 QxMWBq6g1OPVxvQX785EaFDlwxuU2vxsuyCVCGSrPxhghaNEuKcCZx2E4tD185IAAeA/QXrJzRE
 E8LpmA+R+RjdW124mBtQxI54+Aye/P8MV7QhU7Rl9Mv5TQ7rrMXCL3wLtWKVK7bFe3qtiDpZpqh
 b4okEjGVJBBwIOmYqSg==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69829570 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8UNOjA0-WY4o6R8rHOMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IZRUxsOiPZeas0nsB47McJC4yZEdMhHO
X-Proofpoint-GUID: IZRUxsOiPZeas0nsB47McJC4yZEdMhHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B214E012D
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:40:45AM +0100, Ulf Hansson wrote:
> On Mon, 2 Feb 2026 at 20:22, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > >
> > > > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > > > MMCX, the frequencies in the OPP table are wrong, etc.
> > > > >
> > > > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > > > stopping it from being overclocked).
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > > > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > > > this point?
> > >
> > > I'd prefer it if it is picked through the immutable tag/branch.
> >
> > Another option would be to ack merging it through the media tree.
> 
> I didn't think the series was considered as material for v7.0 as it's
> getting late for that.
> 
> Anyway, I have queued patch2 to v7.0 and the patch is also available
> to pull in via an immutable "core" branch in my pmdomain tree.

I think I mixed 7.0 vs 6.20 vs anything. Thanks anyway!

-- 
With best wishes
Dmitry

