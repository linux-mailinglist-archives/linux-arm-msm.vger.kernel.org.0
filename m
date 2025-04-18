Return-Path: <linux-arm-msm+bounces-54774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A3A94021
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 01:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 552527A6FF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 23:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F0A248193;
	Fri, 18 Apr 2025 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9qyvpnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063472472A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017337; cv=none; b=QQ+0W6npKj2zqQFIDdGivwODh68aQjYD18ok1sF2S4l5TkQkQIbEf+WRjBzpBssxSk5zeXCq+7djc06+P+bItFmoOvL+m4iwIrcCjIdpmUSViTgC+RXa8LWb2HQBmrigdWre9jCVOGBoA5dqWn5ZOJLCItG9lWE7Dr+/W2jNNs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017337; c=relaxed/simple;
	bh=Cqy9wXz4Md2dDfVYMq63yQ8yoiIG7qVCmGKjhWNBpRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL4h8YI5qnhr0ZCotM3eqg0xPNW1s0JyGLud8WJS532vpsiZ14xQvZV9d1g2mGAxcYiGvyJVXy3cwXSRkNKXefyOYdqcqTDf4xger+UVgud9/ELit2m4c5mo4850zp6w3honDTlczRiRRMq0Yi/HCo8GlJuazxJ1EUcKmTq24B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9qyvpnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IMUXHJ009481
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/rCdii3k99QNyH4v5GZVV/R
	W4IUX5b1L2951avVf88=; b=b9qyvpnGQUYzs2i7Mvx3EouHvPtEV06WOmwA/7FQ
	Pr5fPVwJ+mNV6x9NS/Sy7Wdz8ur5/zJ4uVxdYLTnCEIJY/J1kIfNZqgNTkdrJ07v
	3eiN+0Nkc3qAV+G6puOnH6538Ns3hMTLp62ddy0ffTkrKOQwj4S9ns+IgQ3rgOcs
	dVTBxatJdDzh6kEDZL/npaMw/3zHQ3UKbYSz5/GN+o+jwjVvr2ai4HepTDcTMg6a
	ImRpewDN+O19KA9PCHF3MibhHh4Xh+iqhmYeKdNqm/+DpMzIKXlwDlrlbR/+LVgT
	0mgQkQada8idVQsx0h0tAC03cvX9xcuoYYERsS85BNKEWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvgeef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:02:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so687134385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 16:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017333; x=1745622133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/rCdii3k99QNyH4v5GZVV/RW4IUX5b1L2951avVf88=;
        b=gCKQa7GDuI4uETe8CfwV6g0ooyaFfg0fXD2dso7u/p8OEW2rgdf61XsnSjH2LHzF4T
         UiuvKHutww1YceIYfziHhbAkveiHoSCtmpT7Rm1SAwCiu0Cx4OrObf1XN/YFkXuriUNt
         PqqutvHlrhuWueSluDC+o76VEOzsNyJPaEL8ozDi5keGxYhzW547pcCSzPLDk6kUg/cy
         SKp+RFfo7dL3Q8E3I7iOLPc30cm9hWesjZcLyI3D8zKRiqC0fdRqJUzKhbM0wiIfiPtO
         N6QCEkdCHuvLyd13lygmi0h4vEjiLbSA56iAzX1gOE75CJiYV8XJlKsZ/5NlFYvTDXwo
         zf0A==
X-Forwarded-Encrypted: i=1; AJvYcCVuNwNu0jbWuU6dbeoeRXkOpda9BYBowip+4gEyKlZ+Cz13FWTQyGg4OZgeS3idKOJaqbrqAwJjIejTS4H/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vgMhqndnV9J1UXzfBMhm9GgSgzZpnJdnEl4tdkTbq+ngpUd3
	VOQ6/OeIkFQWnQT/l9Qm9sW25S95KyMOTFzfnyv0a0htghGQfxhs/dQXvCj4gbFeKOZw+IKU891
	rixQhfJzuGOMY0kQPKw/e8VIQlw2rZms47Za/48MnLjsT+v11ORfdHGoZvL0aK3/2
X-Gm-Gg: ASbGncvyrUM8ErrHRtW4R/EFdxeOFF+uI9LZ3E3/fjSNMvNEw0A3E1yJ5HUh/UIo81d
	mnPk9+R2ImYYeoOojSeDpUk9BAzQA2YlXjcGHcIscnocJcc9yk6ciHu1E55753DxhPseBgBZwtm
	oZ48HZkbgW8sAw35uLQ0QlaMB4aPofuvh05sqs6qGdumGEZ4CTKkv4ik1sO5v5cKiM5SszOFujH
	ZFp3irff+3x1plGZkzoij2sLMABLyhRy+RqgryJMUGRKWnkzqXmwfGVRGwqiETcYr2KmE6MbwiV
	YFYCp+nzhUT2ntu4/jJl2h4OiSfgA+P0sotGxSTSswC214jOwMts02B1YIUp0l8XoWK2I8v6+C0
	=
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697465985a.17.1745017333599;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOvHKeAZS5vASogCzZeo+qEyJxQ15QLGhBMc3CRYTpJqeXQEMRI79G+EUi5azW028Wqu1vaA==
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697461685a.17.1745017333209;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e5163sm290371e87.184.2025.04.18.16.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:02:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Message-ID: <j3xylbgcvamtiumndssy73h646vwwdfyxju3t6wtpfhcd4f6fw@qgmbrcz6njgk>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
 <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
 <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
X-Proofpoint-ORIG-GUID: v0s7JopjypcNcAwkAiNMHT6e0G5GknxN
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802d9f6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=eUQzuGhTgxr9iOTw7QAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: v0s7JopjypcNcAwkAiNMHT6e0G5GknxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=978
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180176

On Fri, Apr 18, 2025 at 03:27:22PM +0200, Luca Weiss wrote:
> Hi Krzysztof, hi Dmitry,
> 
> Any feedback on the below proposed patch?
> 
> I can also send out a v3 with this patch included soon if that makes it
> easier to review.
> 
> Regards
> Luca
> 
> On Tue Apr 1, 2025 at 11:32 AM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
> >> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
> >>> This series adds all the necessary bits to enable DisplayPort-out over
> >>> USB-C on Fairphone 5.
> >>> 
> >>> There's currently a dt validation error with this, not quite sure how to
> >>> resolve this:
> >>> 
> >>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> >>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
> >>
> >> This comes from usb-switch.yaml, it requires that 'port' adheres to the
> >> /schemas/graph.yaml#/properties/port (which forbids extra properties).
> >> The usb-switch.yaml needs to be fixed to use port-base for that node.
> >
> > Thanks, do you think the attached patch would be suitable? It does fix
> > the warning for me, but not sure if it's too lax or doing the wrong
> > thing.
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > index da76118e73a5..9598c1748d35 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > @@ -26,11 +26,15 @@ properties:
> >      type: boolean
> >  
> >    port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> >      description:
> >        A port node to link the device to a TypeC controller for the purpose of
> >        handling altmode muxing and orientation switching.
> >  
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base

Please document that the only permitted property here is data-lanes.

> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> >
> >
> > Regards
> > Luca
> >
> >>
> >>> 
> >>> See also this mail plus replies:
> >>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Changes in v2:
> >>> - Move adding "*-switch;" properties already in earlier patches
> >>> - Move wiring up SS USB & DP to SoC instead of being done in device
> >>> - Pick up tags
> >>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com
> >>> 
> >>> ---
> >>> Luca Weiss (3):
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
> >>> 
> >>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
> >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
> >>>  2 files changed, 104 insertions(+), 8 deletions(-)
> >>> ---
> >>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
> >>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
> >>> 
> >>> Best regards,
> >>> -- 
> >>> Luca Weiss <luca.weiss@fairphone.com>
> >>> 
> 

-- 
With best wishes
Dmitry

