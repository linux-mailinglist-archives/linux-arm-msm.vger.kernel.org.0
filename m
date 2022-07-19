Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41265792AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 07:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236869AbiGSFt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 01:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbiGSFt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 01:49:26 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7980330F7E
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:49:25 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10d7170b2fcso904909fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=yW4sxd/rSfY0mjBvxj6NVim/qvTzr2TopHALi6gFszU=;
        b=NAxY5QN4hAKJwVowqc9LH6lFKLz5HnjlPC9tcgg2oorLto+Ons5jzv8gUBiJkL55Au
         Hseeh/SZEYf9W+bZdts2RRH1Lgr3ev7kfyrSj7vIAzI04R4HzAo8R1SCuZdKh67PjBNi
         T+xuS2ruT06MwvcL82x3Wv+AGbFBXSv/O0kBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=yW4sxd/rSfY0mjBvxj6NVim/qvTzr2TopHALi6gFszU=;
        b=oiFUFUXLTMBMHzhUm6Lx4O2mo60BCvQEcHO+7Ns6bs6bf8PxDg7u3ZxYidMjJ/37BE
         n47sity9PtjvEbMVS2/W7ghCpGaV3ls8WO9AIB0X6oJydy9Ommbwzh5gW5CdFNUVaQdx
         4C5bLNYqM9NrJC6ea+bMMjr55H/hfUbRFfM3DO3YGNtMndDDYAwFBFrT2h/CbK8MJexp
         uWIydGfbrgLXfumMzJnU6bD//zfQhQIGy0zUkx/KvGTRaFc+Px/lMx3acY8TBwI4W0kt
         rf/N+TEQqahQrAUrQKWZ8h22HqR+0dY5vken2I2ECyd1hyAMCzyBezGo0bz5be8PUlGb
         jnJg==
X-Gm-Message-State: AJIora/tXI9IXIhQJH2R7R1Kdj9jagZ1o/a3D/ClcjcPa+yFpVgCL6N2
        sqWuNl2kkyZ6CMAYFqYjXkJuFjmM6oygDP1hV2eWgA==
X-Google-Smtp-Source: AGRyM1vIxz8QjHUizNOQmAPd15ZPPBtKVcbtcagMWpaB45V9j3SYDpkwdeou7jUf4qcYiU8TW7NHWBtxz4iJD0ZRX8I=
X-Received: by 2002:a05:6870:41c3:b0:10c:529c:3844 with SMTP id
 z3-20020a05687041c300b0010c529c3844mr15985898oac.0.1658209764467; Mon, 18 Jul
 2022 22:49:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Jul 2022 01:49:23 -0400
MIME-Version: 1.0
In-Reply-To: <e4dcdd8d-18a9-8da3-7ac3-6cc792139f70@quicinc.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
 <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
 <c022538d-c616-8f1a-e1c2-c11b5f0de670@quicinc.com> <e4dcdd8d-18a9-8da3-7ac3-6cc792139f70@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 19 Jul 2022 01:49:23 -0400
Message-ID: <CAE-0n52TG3hsytN5nRU7W=S6PffSj8yQDmuicN0-qxoW-jxiZQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <quic_tdas@quicinc.com>, quic_rjendra@quicinc.com
Cc:     devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

UXVvdGluZyBBa2hpbCBQIE9vbW1lbiAoMjAyMi0wNy0xOCAyMTowNzowNSkNCj4gT24gNy8xNC8y
MDIyIDExOjEwIEFNLCBBa2hpbCBQIE9vbW1lbiB3cm90ZToNCj4gPiBPbiA3LzEyLzIwMjIgNDo1
NyBBTSwgRG91ZyBBbmRlcnNvbiB3cm90ZToNCj4gPj4gSGksDQo+ID4+DQo+ID4+IE9uIEZyaSwg
SnVsIDgsIDIwMjIgYXQgMTE6MDAgUE0gQWtoaWwgUCBPb21tZW4NCj4gPj4gPHF1aWNfYWtoaWxw
b0BxdWljaW5jLmNvbT4gd3JvdGU6DQo+ID4+PiBVcGRhdGUgZ3B1IHJlZ2lzdGVyIGFycmF5IHdp
dGggZ3B1Y2MgbWVtb3J5IHJlZ2lvbi4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBa2hp
bCBQIE9vbW1lbiA8cXVpY19ha2hpbHBvQHF1aWNpbmMuY29tPg0KPiA+Pj4gLS0tDQo+ID4+Pg0K
PiA+Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+ID4+Pg0KPiA+Pj4gwqAgYXJjaC9hcm02NC9i
b290L2R0cy9xY29tL3NjNzI4MC5kdHNpIHwgNiArKysrLS0NCj4gPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQ0KPiA+Pj4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3MjgwLmR0c2kNCj4gPj4+IGluZGV4IGU2NmZjNjcuLmRl
ZmRiMjUgMTAwNjQ0DQo+ID4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3Mjgw
LmR0c2kNCj4gPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zYzcyODAuZHRzaQ0K
PiA+Pj4gQEAgLTIyMjgsMTAgKzIyMjgsMTIgQEANCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInFjb20sYWRyZW5vLTYz
NS4wIiwNCj4gPj4+ICJxY29tLGFkcmVubyI7DQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDAgMHgwM2QwMDAwMCAwIDB4NDAwMDA+
LA0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDwwIDB4MDNkOWUwMDAgMCAweDEwMDA+LA0KPiA+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwwIDB4MDNkNjEw
MDAgMCAweDgwMD47DQo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPDAgMHgwM2Q2MTAwMCAwIDB4ODAwPiwNCj4gPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8MCAw
eDAzZDkwMDAwIDAgMHgyMDAwPjsNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWctbmFtZXMgPSAia2dzbF8zZDBfcmVnX21lbW9yeSIsDQo+
ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgImN4X21lbSIsDQo+ID4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImN4X2Ri
Z2MiOw0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJjeF9kYmdjIiwNCj4gPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
Z3B1Y2MiOw0KPiA+PiBUaGlzIGRvZXNuJ3Qgc2VlbSByaWdodC4gU2hvdWxkbid0IHlvdSBiZSBj
b29yZGluYXRpbmcgd2l0aCB0aGUNCj4gPj4gZXhpc3RpbmcgZ3B1Y2MgaW5zdGVhZCBvZiByZWFj
aGluZyBpbnRvIGl0cyByZWdpc3RlcnM/DQo+ID4+DQo+ID4gSUlVQywgcWNvbSBnZHNjIGRyaXZl
ciBkb2Vzbid0IGVuc3VyZSBoYXJkd2FyZSBpcyBjb2xsYXBzZWQgc2luY2UgdGhleQ0KPiA+IGFy
ZSB2b3RlLWFibGUgc3dpdGNoZXMuIElkZWFsbHksIHdlIHNob3VsZCBlbnN1cmUgdGhhdCB0aGUg
aHcgaGFzDQo+ID4gY29sbGFwc2VkIGZvciBncHUgcmVjb3ZlcnkgYmVjYXVzZSB0aGVyZSBjb3Vs
ZCBiZSB0cmFuc2llbnQgdm90ZXMgZnJvbQ0KPiA+IG90aGVyIHN1YnN5c3RlbXMgbGlrZSBoeXBl
cnZpc29yIHVzaW5nIHRoZWlyIHZvdGUgcmVnaXN0ZXIuDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJl
IGhvdyBjb21wbGV4IHRoZSBwbHVtYmluZyB0byBncHVjYyBkcml2ZXIgd291bGQgYmUgdG8gYWxs
b3cNCj4gPiBncHUgZHJpdmVyIHRvIGNoZWNrIGh3IHN0YXR1cy4gT1RPSCwgd2l0aCB0aGlzIHBh
dGNoLCBncHUgZHJpdmVyIGRvZXMgYQ0KPiA+IHJlYWQgb3BlcmF0aW9uIG9uIGEgZ3B1Y2MgcmVn
aXN0ZXIgd2hpY2ggaXMgaW4gYWx3YXlzLW9uIGRvbWFpbi4gVGhhdA0KPiA+IG1lYW5zIHdlIGRv
bid0IG5lZWQgdG8gdm90ZSBhbnkgcmVzb3VyY2UgdG8gYWNjZXNzIHRoaXMgcmVnaXN0ZXIuDQo+
ID4NCj4gPiBTdGVwaGVuL1JhamVuZHJhL1Rhbml5YSwgYW55IHN1Z2dlc3Rpb24/DQoNCldoeSBj
YW4ndCB5b3UgYXNzZXJ0IGEgZ3B1IHJlc2V0IHNpZ25hbCB3aXRoIHRoZSByZXNldCBBUElzPyBU
aGlzIHNlcmllcw0Kc2VlbXMgdG8ganVtcCB0aHJvdWdoIGEgYnVuY2ggb2YgaG9vcHMgdG8gZ2V0
IHRoZSBnZHNjIGFuZCBwb3dlciBkb21haW4NCnRvICJyZXNldCIgd2hlbiBJIGRvbid0IGtub3cg
d2h5IGFueSBvZiB0aGF0IGlzIG5lY2Vzc2FyeS4gQ2FuJ3Qgd2UNCnNpbXBseSBhc3NlcnQgYSBy
ZXNldCB0byB0aGUgaGFyZHdhcmUgYWZ0ZXIgcmVjb3ZlcnkgY29tcGxldGVzIHNvIHRoZQ0KZGV2
aWNlIGlzIGJhY2sgaW50byBhIGdvb2Qga25vd24gUE9SIChwb3dlciBvbiByZXNldCkgc3RhdGU/
DQo=
