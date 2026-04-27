Return-Path: <linux-arm-msm+bounces-104740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAFVL8pi72mHAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:21:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FB4734D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AEB83052881
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361E279792;
	Mon, 27 Apr 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4NgRrD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnpEdmdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844123C4573
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295884; cv=none; b=drOLusBCukdhhhtrNc7+bpxQUgQtvPEOWHoMyTjE3DVTYBtm+nSBmOw97Ccb5TrvZaNHiYM9MksOstR7tAuJEbJz9B0qDylY6TuM+0SmOfbufmcnuNd1SYaWKV60+RjKpQ/WMsKYaVImjt+E/8y3UfNbTOY6qqWcmRg+9co2K/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295884; c=relaxed/simple;
	bh=HTrVirHkAZ88WnRz7XsFUiuvNW5SmPu4mYPKWSHGV/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/nLr9axgDySuQQb3m3zJxEsPBfsnJgEBd9RQBlSBo2PLG6tPKmgHWXr+4PS7WMpJRQAt0GlPnI43FgwRTSHdov9ViMkwh3HNTcOYhxlE5q7OZ+ESCwhadA8g7rD8g+ACJ8Of6H6nvUuj48ivKfyQDR5Kw5tYyBlffauHjvtohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4NgRrD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnpEdmdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kHxb3961984
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=; b=P4NgRrD1u3k9P+rA
	nTOluwo97ECbZPR26h8/bfWGOoJf/Vom2u74VmvlYNz8Wusl7pfINOytYowQ1kVC
	L3sjiVSdO/cY9dX1opJEtQh8y7fGFm3jly1Xv1fAmzMN/CtCwH3wRUP0akUGyYR6
	oeGyIyMSU5Wx3SoGD85Jqn1CBhro+r/vx8hVvloR8JiQqeoft7PrQB544G+oKawV
	IShBka56wwFy78x9dz/b4lLM+uLYoO7G0YiMDPk2JOAABroiNs0Tq47HG+PxoUds
	iqb/gxHbiMN4WLHvEIOmm/6rw5IjqkoFK3dyAqhpbdBQOCcRZYEQxzBRNyVwwtw7
	UGo+9w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k3185q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:18:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de248f59eso572355241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777295882; x=1777900682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=;
        b=fnpEdmdlCf5zck5tbAcD+9yvRKJJsvYND6JxgX+5vmOwYGqULvAF/PPR0hSzg1LjU4
         rwr52dln/JYMMqeb4W4RxBrymtCTk5xw4arZAg0q7jneIr3PA54I4CDBlWNRZGDEXgz5
         OPxenR6qC+uR9l3so5Vh0KR6Gs/FImVeFx33qdXtNunPEp9UOYTo9H7ZWGgHf2H/GQ9f
         kNsZSldl/2s/6/y93O1chXeNb1mCr4QCytOSDfCcTqKBjq/2TElzX4487EuYYlLSI74v
         W9OOAzeXNoF7fPjN+o7bAfHouetGROeXrIXMvgrbkcySpO1wKsd2gRM0UbB08up/+ip1
         mZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295882; x=1777900682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlIS0COxbByFQx/A4+oy9WRIq+9vt2F7N2ykLMySeh0=;
        b=elzcOFhFRJJRlt0EfWs32m1evJPaoyJZhjovEOYIxscmaWFzSZHeqetokbMsgSyncf
         QmRPT7aqO/MXxmZQcZjDU+HjaK4AZjnwkiy5ZI6F2Px3FmhP/unm3mTc+1Gsulc9DGmi
         Vhp0ViNJafuzcVPG4Vq0mvLMcMWAXD1kyoIMHzTfHPsQ1is13LZhMaTxX/sH988tikxe
         reuX/wjES1TBhX95Uqs5HdSk1MG7+v3Ltm6Bd0jm2aHxUZdJpOHK+yr6DTV5DcVzUzkH
         grju2An9HqiKKj8IpD3iOosmUb+H7cxAWnMudakD/7zJ/n8+1CXsMNtwGeBNvzznQ5j1
         P3Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9tKqcSGhaYyoHmUvg4VDo7EcZt7OTgBeJ3NUrMri9ZRRikCQr183wBKeHCAElqE5BtcwTYfOPGZu/vNs6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0EGqb9IvKz3KiYP1odxeSwlnWwVzr02WKylcEiNOD+6s7aQV
	ZcsolEDa8duFBE9ZlkUQZHI0RZ4N6QKkW9QuD8ziK9yjmV5lpZbXKmPihQVHgg7o4VjyW1495/x
	oc8q9Os26tmv7P0iGY4wlvpapLx7KgFAB/JhkF2tegiusuZgH9QlwC7snqZjLLgUdt2g1
X-Gm-Gg: AeBDiet7fGMYEHOaSfc+3H7Tl4H6v2FfOqQF5i9p14O80P9IobtM8V79KB6oT0kx2An
	IY8OllImVzF7v0olq2ZIA+iunYVQcuh/3ijzXV2RHyORxpF8oCL0ZPTjbyUHxJQUiZx9S8AmfkI
	y8OCEm8QGpWxLMCFEpKfjWt3STImZa6mJkqAYwNCdVomCnuSjtPEA73j34r6IrL5Dadp5dCAQSu
	WV6vcpc6GZRkL/raNlB3+ZXQXrsQuMLKmu/nraVxKAbvx6Kh66Tajhrvxayla+9n2RyfTVFu7oY
	HbzJZTd9EtaTEj6RscCzS6WtdH2BIWHEIvSw6Y61IIyBcR/4U12ur+vtCcaZTZ6TpPqeoIn3kfD
	glfHjGEw7xvUVelqIo1pIUtnpzL/UaUb8RvvJ5VJdntzl7hj0lrhEGDGwko9QmAGn0fWHCEJeOI
	XpLMSyunHYsrbdAg==
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1122150137.1.1777295881753;
        Mon, 27 Apr 2026 06:18:01 -0700 (PDT)
X-Received: by 2002:a05:6102:8501:20b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-62352cd5657mr1122124137.1.1777295880987;
        Mon, 27 Apr 2026 06:18:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm1136706166b.10.2026.04.27.06.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:18:00 -0700 (PDT)
Message-ID: <5d2d7909-9b15-4378-a05b-6803daa27559@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:17:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
 <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-3-797e54b3d464@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0MSBTYWx0ZWRfX4yGsEGihWDR7
 uTvW/qbJoEy8AbnAtWDge+hirYwQme990mozkubkUTUXGYSzQcZIK795RcIDii7VTySMUzwJuCx
 B6iLXMI3r84noXEwt7PmaiKNCqxxI+v/eyJQrdf25bv4UDsjoPYRdV1Y703+A0mISN+HPuSrj15
 3+gf541NVsKo0EKDL6TRllBtysqKdRBwj1Vn2uOsdPaMqMqQzgkXCh6t+KKXl3R4IN1PxXQ0aVB
 7tL98AjwF4UywL9rrV/SSmL7vDEUhXxDUNrHwOxdftKSIW8zVqvGLv9VhNFIWhb2/2F2COxWKRq
 LtqpAi+BWBBGsdh7aJJhPisOWD50Msl7Op4Gi+54X3WMEz7qOWDI0RS76N0bls1AHAxrbPZZ6uF
 69Ras7G2qCpTeP72bsCDGy59l9ZrPfnslNQ+5+/SX89LOtqQc8aV1ZJbQOOMM+STyvb3bZ1Q87m
 OKG9eVlhtDZWAl0OXjg==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef620a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FUsajQaAIeak7Cqb3WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: GhrodIBa9qby5rI_VpJDM24JrFPcUoun
X-Proofpoint-ORIG-GUID: GhrodIBa9qby5rI_VpJDM24JrFPcUoun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270141
X-Rspamd-Queue-Id: D64FB4734D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104740-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 8:38 AM, Taniya Das wrote:
> When the clock controller is probed with 'use_rpm' enabled, the
> runtime PM reference is currently released using pm_runtime_put(),
> which may return before the runtime suspend has completed. When the
> clock controller device is registered through this function, calling
> pm_runtime_disable() immediately after pm_runtime_put() prevents
> the runtime suspend from completing, leaving the clock controller
> active and the HW rails in the ON state.
> 
> Use pm_runtime_put_sync() instead to ensure the runtime PM “putV
> completes synchronously during probe. This does not have any functional
> impact, but it guarantees that the device is fully runtime-suspended
> before returning.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

